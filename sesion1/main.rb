#!/usr/bin/env ruby
# coding: utf-8

require_relative "newton_raphson"
require_relative "planet"

t = begin
      ARGV[0].strip.to_f
    rescue NoMethodError
      0
    end
tierra = Planet.new(1, 0.017, 365.26)
nr = NewtonRaphson.new(
  Math::PI,
  ->(u) { tierra.f(u) - tierra.ξ(t) },
  ->(u) { tierra.df(u) }
)

ap = nr.approximate 1e-5
puts "Aproximación de u para t=#{t}: #{ap}"
puts "Posición de la Tierra: #{tierra.position(ap)}"
  
