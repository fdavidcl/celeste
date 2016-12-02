#!/usr/bin/env ruby
# coding: utf-8

# Cargamos las dependencias necesarias
require "yaml"
require_relative "planet"
require "nyaplot"

NUMBER_POINTS = 50

def plot_orbit planets, name
  plot = Nyaplot::Plot.new
  # Añade origen (sol)
  sol = plot.add(:scatter, [0], [0])
  sol.color(Nyaplot::Colors.YlOrRd)
  sol.tooltip_contents(["Sol"])

  planets.each do |planet|
    plot.add(:scatter, *planet.orbit.transpose)
  end

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
  puts planet
  puts "Posición en t=#{t}: #{planet.x(t)}"
  puts "Velocidad en t=#{t}: #{planet.velocity(t)}"
  puts "Comprobación de Newton-Raphson vs. Fourier:"
  planet.eccentric_test(t)
  puts "Área encerrada por la órbita: #{planet.area}"
  puts "Momento angular en t=#{t}: #{planet.c(t)}"
  puts "Energía teórica: #{planet.h}, energía en t=#{t}: #{planet.calculate_energy(t)}"
  puts nil
end

plot_orbit planets[0 .. 3], "inner"
plot_orbit planets[4 ... planets.length], "outer"
