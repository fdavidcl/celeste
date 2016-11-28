#!/usr/bin/env ruby
# coding: utf-8

# Clase que representa un planeta, englobando los parámetros que
# nos permiten calcular su posición en el tiempo
class Planet

  # Datos miembro
  #  - name:   nombre del planeta
  #  - a:      semieje mayor de la elipse
  #  - ε:      módulo del vector de excentricidad
  #  - period: período de la órbita
  attr_accessor :name, :a, :ε, :period

  def initialize name, a, ε, period
    self.name = name
    self.a = a
    self.ε = ε
    self.period = period
  end

  # Método que calcula el semieje menor de la órbita
  def b
    a * Math::sqrt(1 - ε**2)
  end

  # Método que calcula la posición del planeta dada la anomalía
  # excéntrica u
  def position_for_excentric u
    [a * Math::cos(u) - ε, a * Math::sqrt(1 - ε**2) * Math::sin(u)]
  end

  def excentric t
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

  def position t
    position_for_excentric excentric(t)
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
    half = (0 .. points).map { |i| position(i * increment) }
    half + half.map { |x,y| [x, -y] }
  end

  def to_s
    "#{name} (#{a} AU, period: #{period} Earth days, eccentricity: #{ε})"
  end
end
