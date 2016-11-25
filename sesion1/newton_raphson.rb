#!/usr/bin/env ruby
# coding: utf-8

class Approximator
  attr_accessor :current
  
  def initialize initial
    self.current = initial
  end

  def next_one
    raise NotImplementedError
  end

  def each
    loop do
      yield current
      self.current = next_one
    end
  end

  def approximate tolerance
    previous = Float::INFINITY
    until (current - previous).abs < tolerance
      previous = current
      self.current = next_one
    end
    current
  end

  include Enumerable
end

class NewtonRaphson < Approximator
  attr_accessor :function, :derivative
  
  def initialize initial, function, derivative
    super(initial)
    self.function = function
    self.derivative = derivative
  end
  
  def next_one
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
    ->(u) { 1 - Math::cos(u) }
  )
  puts example.approximate 1e-5
end
