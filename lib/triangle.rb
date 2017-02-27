require 'pry'

class Triangle
  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    @sides = [@side1, @side2, @side3]
  end

  def triangle_inequality
    if @side1 + @side2 <= @side3
      return true
    elsif @side2 + @side3 <= @side1
      return true
    elsif @side3 + @side1 <= @side2
      return true
    else
      return false
    end
  end

  def kind
    if @sides.find {|s| s <= 0} != nil || self.triangle_inequality == true
      raise TriangleError
    elsif @side1 == @side2 && @side2 == @side3
      return :equilateral
    elsif @side1 != @side2 && @side2 != @side3 && @side1 != @side3
      return :scalene
    else
      return :isosceles
    end
  end
end

class TriangleError < StandardError
  def message
    "THAT'S A SHITTY FUCKING TRIANGLE"
  end
end
