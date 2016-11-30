#!/usr/bin/env ruby
# coding: utf-8

require_relative "newton_raphson"
require_relative "series"
require "gsl"

# Clase que representa un planeta, englobando los parámetros que
# nos permiten calcular su posición en el tiempo
class Planet
  private
  # Método que calcula el semieje menor de la órbita
  def semiminor_from_semimajor a, ecc
    a * Math::sqrt(1 - ecc**2)
  end

  public
  # Datos miembro
  #  - name: nombre del planeta
  #  - semimajor_axis: semieje mayor de la elipse
  #  - eccentricity: módulo del vector de excentricidad
  #  - period: período de la órbita
  attr_accessor :name, :a, :b, :ε, :period
  alias :eccentricity :ε
  alias :semimajor_axis :a
  alias :semiminor_axis :b

  def initialize name, a, ε, period
    self.name = name
    self.a = a
    self.ε = ε
    self.b = semiminor_from_semimajor(a, ε)
    self.period = period
  end

  # Método que calcula la posición del planeta dada la anomalía
  # excéntrica u
  def position_for_eccentric u
    [a * Math::cos(u) - ε, a * Math::sqrt(1 - ε**2) * Math::sin(u)]
  end

  def eccentric_newton t
    # Aproximamos la anomalía excéntrica mediante
    # Newton-Raphson
    xi = ξ(t)
    NewtonRaphson.new(
      Math::PI,
      # La función que lleva u en f(u) - ξ
      ->(u) { f(u) - xi },
      # La función que lleva u en f'(u)
      ->(u) { df(u) }
    ).approximate
  end

  def eccentric_fourier t
    xi = ξ(t)
    xi + SeriesApproximator.new(
      ->(n) { 2.0/n * GSL::Sf::bessel_Jnu(n, n * self.ε) * Math::sin(n * xi) }
    ).approximate
  end
  alias :eccentric :eccentric_fourier

  def eccentric_test
    n = 50
    (0 .. n).each do |i|
      puts "Newton: #{eccentric_newton i*period/n} Fourier: #{eccentric_fourier i*period/n}"
    end
  end

  def position t
    position_for_eccentric eccentric(t)
  end
  alias :x :position

  # Cálculo de la distancia al sol
  def distance_to_sun t
    a * (1 - ε * Math::cos(eccentric t))
  end

  # Método que calcula el escalar independiente de u de la ecuación
  # de Kepler
  def ξ t
    # Consideramos tiempo inicial t0 = 0
    2 * Math::PI / period * t
  end

  # Método que evalúa la función dependiente de u de la ecuación
  # de Kepler
  def f u
    u - ε * Math::sin(u)
  end

  # Método que evalúa la derivada de f en u
  def df u
    1 - ε * Math::cos(u)
  end

  def orbit points = 50
    increment = period / (2 * points)
    half = (0 .. points).map { |i| x(i * increment) }
    half + half.map { |x1,x2| [x1, -x2] }
  end

  def to_s
    "#{name} (#{a} AU, period: #{period} Earth days, eccentricity: #{ε})"
  end
end
