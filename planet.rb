#!/usr/bin/env ruby
# coding: utf-8

require_relative "utils"
require_relative "newton_raphson"
require_relative "series"
require "gsl"
require "matrix"

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
  #  - a: semieje mayor de la elipse
  #  - b: semieje menor de la elipse
  #  - ε: módulo del vector de excentricidad
  #  - period: período de la órbita
  attr_accessor :name, :a, :b, :ε, :period, :μ, :h, :i, :Ω, :ω, :matrix3d, :inclination, :rotation1, :rotation2
  # Nombres descriptivos para algunos datos miembro:
  alias :eccentricity :ε
  alias :semimajor_axis :a
  alias :semiminor_axis :b
  alias :energy :h

  def initialize name, a, ε, period, inclination, nodeline_omega, omega_bar
    self.name = name
    self.a = a
    self.ε = ε
    self.b = semiminor_from_semimajor(a, ε)
    self.period = period
    self.μ = (2 * Math::PI / period)**2 * a**3
    self.h = -μ / (2*a)
    self.i = inclination / 180.0 * Math::PI
    self.Ω = nodeline_omega / 180.0 * Math::PI
    self.ω = (omega_bar - nodeline_omega) / 180.0 * Math::PI

    self.inclination = Matrix[
      [1, 0, 0],
      [0, Math::cos(i), -Math::sin(i)],
      [0, Math::sin(i), Math::cos(i)]
    ]
    self.rotation1 = Matrix[
      [Math::cos(ω), -Math::sin(ω), 0],
      [Math::sin(ω), Math::cos(ω), 0],
      [0, 0, 1]
    ]
    self.rotation2 = Matrix[
      [Math::cos(Ω), -Math::sin(Ω), 0],
      [Math::sin(Ω), Math::cos(Ω), 0],
      [0, 0, 1]
    ]
  end

  # Método que calcula la posición del planeta dada la anomalía
  # excéntrica u
  def position_for_eccentric_2d u
    [a * Math::cos(u) - ε, a * Math::sqrt(1 - ε**2) * Math::sin(u)]
  end
  
  def position_for_eccentric_3d u
    twod = Matrix[[*position_for_eccentric_2d(u), 0]].transpose
    (rotation2 * inclination * rotation1 * twod).to_a.flatten
  end

  alias :position_for_eccentric :position_for_eccentric_3d

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

  # Elegimos el cálculo de la anomalía excéntrica que queremos usar:
  alias :eccentric :eccentric_fourier

  # Derivada de la excéntrica
  def d_eccentric t
    2 * Math::PI/(period * (1 - ε * Math::cos(eccentric t)))
  end

  # Comprobación del funcionamiento de ambos métodos de aproximación
  def eccentric_test *ts
    ts.flatten.each do |t|
      puts " [u(t=#{t})] Newton: #{eccentric_newton t} Fourier: #{eccentric_fourier t}"
    end
  end

  # Cálculo de la posiciñon en un instante dado
  def position t
    position_for_eccentric eccentric(t)
  end
  alias :x :position

  def velocity t
    u = eccentric(t)
    du = d_eccentric(t)
    [-a * Math::sin(u) * du, b * Math::cos(u) * du]
  end

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

  # Aproxima la órbita del planeta en un número de puntos
  # (equidistribuidos) dado
  def orbit points = 100
    increment = period / points
    (0 .. points).map { |i| x(i * increment) }
    #half + half.reverse_each.map { |x1,x2,x3| [x1, -x2] }
  end

  def to_s
    "\e[1m#{name}\e[m (#{a} AU, period: #{period} Earth days, eccentricity: #{ε})"
  end

  def angular_moment t
    [0, 0, a**2 * d_eccentric(t) * Math::sqrt(1 - ε**2) * (1 - ε * Math::cos(eccentric(t)))]
  end
  alias :c :angular_moment
  
  def calculate_energy t
    # Módulo de la velocidad al cuadrado
    dxsquare = velocity(t).norm ** 2

    xmod = position(t).norm
    
    kinetic = dxsquare/2
    potential = μ / xmod

    kinetic - potential
  end
  alias :h :energy

  def area t0 = 0, t1 = self.period
    t0, t1 = 0, self.period if (t1 - t0).abs > self.period
    c(t0).norm * (t1 - t0) / 2
  end
end
