#!/usr/bin/env ruby
# coding: utf-8

# Cargamos las dependencias necesarias
require "yaml"
require_relative "newton_raphson"
require_relative "planet"
require "nyaplot"

NUMBER_POINTS = 100

def orbit_for planet
  increment = planet.period / (NUMBER_POINTS)
  (0 ... NUMBER_POINTS).map do |i|
    planet.position(i * increment)
  end
end

def plot_orbit name, data
  plot = Nyaplot::Plot.new
  # Añade origen (sol)
  sol = plot.add(:scatter, [0], [0])
  sol.color(Nyaplot::Colors.YlOrRd)
  orbit = plot.add(:scatter, *data.transpose)
  plot.export_html "#{name}.html"
end

# Leemos los argumentos proporcionados por el usuario
t = begin
      ARGV[0].strip.to_f
    rescue NoMethodError
      0
    end

planets = YAML.load_file("planets.yaml")
            .map { |name, pars| Planet.new name, *pars.values }

planets.each do |planet|
  puts "Posición de #{planet.name}: #{planet.position(t)}"
  
  plot_orbit planet.name, orbit_for(planet)
end
