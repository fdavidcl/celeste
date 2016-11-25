#!/usr/bin/env ruby
# coding: utf-8

class Planet
  attr_accessor :a, :ε, :period
  def initialize a, ε, period
    self.a = a
    self.ε = ε
    self.period = period
  end

  def position u
    [a * Math::cos(u) - ε, a * Math::sqrt(1 - ε**2) * Math::sin(u)]
  end

  def ξ t
    # Consideramos tiempo inicial t0 = 0
    2 * Math::PI / period * t
  end

  def f u
    u - ε * Math::sin(u)
  end

  def df u
    1 - ε * Math::cos(u)
  end
end
