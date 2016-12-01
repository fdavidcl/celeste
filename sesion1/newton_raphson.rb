#!/usr/bin/env ruby
# coding: utf-8

require_relative "approximator"

class NewtonRaphson < Approximator
  # Datos miembro
  #  - function:   almacena la función f
  #  - derivative: almacena la derivada de f
  attr_accessor :function, :derivative
  
  def initialize initial, tolerance = DEFAULT_TOLERANCE, function, derivative
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
    ->(u) { u - ε * Math::sin(u) - ξ },
    ->(u) { 1 - ε * Math::cos(u) }
  )

  # Genera las primeras 100 aproximaciones
  puts example.take(10).to_s
end
