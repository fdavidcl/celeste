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

# Creamos el planeta Tierra con sus parámetros
tierra = Planet.new(1, 0.017, 365.26)
puts "Posición de la Tierra: #{tierra.position(t)}"
