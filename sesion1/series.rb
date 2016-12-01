#!/usr/bin/env ruby
# coding: utf-8

require_relative "approximator"

class SeriesApproximator < Approximator

  # Datos miembro
  #  - term: función que evalúa el término n-ésimo de la serie
  #  - n: índice del término actual se la serie
  attr_accessor :term, :n
  
  def initialize tolerance = DEFAULT_TOLERANCE, term
    super(0, tolerance)
    self.term = term
    self.n = 0
  end

  # Calcula el siguiente término de la serie y lo suma a
  # la aproximación actual
  def next_one
    self.n += 1
    self.current += term.call(n)
  end
end

# Si el archivo es el actual, ejecutamos un ejemplo de
# aproximación de series
if __FILE__ == $0
  # Serie de término n->1/2^n (suma 1)
  series = SeriesApproximator.new(->(n) { 1.0/2**n })
  puts series.take(20).to_s
end
