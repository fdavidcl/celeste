#!/usr/bin/env ruby
# coding: utf-8

# Clase base para métodos numéricos de aproximación de funciones
class Approximator

  # Datos miembro
  #  - current:   valor de la aproximación actual
  #  - tolerance: valor de tolerancia
  attr_accessor :current, :tolerance
  
  def initialize initial, tolerance
    self.current = initial
    self.tolerance = tolerance
  end

  # Método a implementar en las clases hijas
  def next_one
    raise NotImplementedError
  end

  # Método que calcula y proporciona aproximaciones
  def each
    previous = Float::INFINITY
    until (current - previous).abs < tolerance
      # Proporciona una aproximación y espera a que se
      # pida la siguiente
      yield current
      previous = current
      self.current = next_one
    end
  end

  # Método que devuelve la última aproximación
  # para la tolerancia dada
  def approximate
    to_a.last
  end

  # Incluimos herramientas que permiten enumerar
  # las aproximaciones
  include Enumerable
end

class NewtonRaphson < Approximator
  # Datos miembro
  #  - function:   almacena la función f
  #  - derivative: almacena la derivada de f
  attr_accessor :function, :derivative
  
  def initialize initial, tolerance, function, derivative
    super(initial, tolerance)
    self.function = function
    self.derivative = derivative
  end
  
  def next_one
    # Método de Newton-Raphson para encontrar raíces:
    # Calcula Φ(current) = current - f(current)/f'(current)
    current - function.call(current)/derivative.call(current)
  end
end

# Si ejecutamos el archivo actual, mostramos un ejemplo de
# aproximación por Newton-Raphson:
if __FILE__ == $0
  ε = 0.017
  ξ = Math::PI/2
  
  example = NewtonRaphson.new(
    Math::PI,
    1e-12,
    ->(u) { u - ε * Math::sin(u) - ξ },
    ->(u) { 1 - Math::cos(u) }
  )

  # Genera las primeras 100 aproximaciones
  puts example.take(10).to_s
end
