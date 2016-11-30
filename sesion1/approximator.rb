# coding: utf-8

DEFAULT_TOLERANCE = 1e-12

# Clase base para métodos numéricos de aproximación de funciones
class Approximator

  # Datos miembro
  #  - current:   valor de la aproximación actual
  #  - tolerance: valor de tolerancia
  attr_accessor :current, :tolerance
  
  def initialize initial, tolerance = DEFAULT_TOLERANCE
    self.current = initial
    self.tolerance = tolerance
  end

  # Método a implementar en las clases hijas
  def next_one
    raise NotImplementedError
  end

  # Método que calcula y proporciona aproximaciones
  def each
    previous = Float::INFINITY
    until (current - previous).abs < tolerance
      # Proporciona una aproximación y espera a que se
      # pida la siguiente
      yield current
      previous = current
      self.current = next_one
    end
  end

  # Método que devuelve la última aproximación
  # para la tolerancia dada
  def approximate
    to_a.last
  end

  # Incluimos herramientas que permiten enumerar
  # las aproximaciones
  include Enumerable
end
