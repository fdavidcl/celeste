class Array
  def norm
    Math::sqrt(map { |e| e**2 }.reduce(&:+))
  end
end
