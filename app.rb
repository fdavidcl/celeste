#!/usr/bin/env ruby
# coding: utf-8

require "sinatra"
require "yaml"
require_relative "planet"
require "nyaplot"
require "nyaplot3d"

COLORS = [
  "#e91e63",
  "#9c27b0",
  "#3f51b5",
  "#03a9f4",
  "#009688",
  "#4caf50",
  "#cddc39",
  "#ffc107",
  "#795548"
]

def plot_orbit planets, t, colors
  plot = Nyaplot::Plot3D.new
  # Añade origen (sol)
  sol = plot.add(:scatter, [0], [0], [0])
  sol.fill_color("#fdd835")
  sol.name("Sol")

  # Pequeño hack que toma la máxima distancia al sol y dibuja partículas
  # en los límites que obligan a que el rango de los 3 ejes sea el mismo
  l = planets.max_by(&:a).a
  limits = plot.add(:particles, [-l, -l, -l, l, l, l], [-l, -l, l, l, l, -l], [-l, l, l, l, -l, -l])
  limits.size(0.0001)
  limits.has_legend(false)

  planets.zip(colors).each do |planet, color|
    orbit = plot.add(:particles, *planet.orbit.transpose)
    orbit.has_legend(false)
    orbit.color(color)
    orbit.size(0.1)
    
    point = plot.add(:scatter, *[planet.x(t)].transpose)
    point.fill_color(color)
    point.name(planet.name)
    point.size(1)
  end

  plot
end

set :bind, '0.0.0.0'
set :port, 8080
set :environment, :production

def generate_frames
  @planets = YAML.load_file("planets.yaml")
               .map { |name, pars| Planet.new name, *pars.values }
  @inner = @planets[0 .. 3]
  @outer = @planets[4 ... @planets.size]
  
  @frame = Nyaplot::Frame.new
  @frame.add(plot_orbit @inner, @t, COLORS[0 .. 3])
  @frame.add(plot_orbit @outer, @t, COLORS[4 ... @planets.size])
end

get "/" do
  @t = params["t"].to_i
  generate_frames
  haml :index
end
