#!/usr/bin/env ruby
# coding: utf-8

# Cargamos las dependencias necesarias
require_relative "newton_raphson"
require_relative "planet"

# Leemos los argumentos proporcionados por el usuario
t = begin
      ARGV[0].strip.to_f
    rescue NoMethodError
      0
    end

# Creamos el planeta Tierra con sus parámetros, calculamos
# el valor de ξ para el instante t
tierra = Planet.new(1, 0.017, 365.26)
ξ = tierra.ξ(t)

# Creamos el método de aproximación
nr = NewtonRaphson.new(
  Math::PI,
  1e-12,
  # La función que lleva u en f(u) - ξ
  ->(u) { tierra.f(u) - ξ },
  # La función que lleva u en f'(u)
  ->(u) { tierra.df(u) }
)

ap = nr.approximate
puts "Aproximación de u para t=#{t}: #{ap}"
puts "Posición de la Tierra: #{tierra.position(ap)}"
  
