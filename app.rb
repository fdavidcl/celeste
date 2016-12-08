#!/usr/bin/env ruby
# coding: utf-8

require "sinatra"
require "yaml"
require_relative "planet"
require "nyaplot"

def plot_orbit planets
  plot = Nyaplot::Plot.new
  # Añade origen (sol)
  sol = plot.add(:scatter, [0], [0])
  sol.color(Nyaplot::Colors.YlOrRd)
  sol.tooltip_contents(["Sol"])

  planets.each do |planet|
    plot.add(:scatter, *planet.orbit.transpose)
  end

  plot
end

set :bind, '0.0.0.0'

before do
  @planets = YAML.load_file("planets.yaml")
               .map { |name, pars| Planet.new name, *pars.values }
  @inner = @planets[0 .. 3]
  @outer = @planets[4 ... @planets.size]
  
  @frame = Nyaplot::Frame.new
  @frame.add(plot_orbit @inner)
  @frame.add(plot_orbit @outer)
end

get "/" do
  haml :index
end
