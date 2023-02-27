=begin
build a program that takes 3 integers representing the sides of a triangle upon instantiation and determines the type of triangle

equilateral - 3 sides are the same
isosceles - two sides are the same
scalene - all sides are different

errors
  any side is 0
  any two sides are less than or equal to third side

input - integers
output - string or ArgumentError

data structure
  array to hold sides of triangle

algo
  Triangle class
  getter method for sides array
  initialize method
    takes 3 arguments, stores in a sides array
    return an ArgumentError if input is invalid - chech for valid input

  kind method
    evaluates sides and returns corresponding string

  valid method
    all sides are greater than zero
    each two sides are greater than third side

=end

class Triangle
  attr_reader :sides

  def initialize(*sides)
    @sides = sides
    raise ArgumentError, "Invalid input" unless valid?
  end

  def kind
    case sides.uniq.size
    when 1 then 'equilateral'
    when 2 then 'isosceles'
    when 3 then 'scalene'
    end
  end

  private

  def valid?
    sides.min > 0 &&
    sides[0] + sides[1] > sides[2] &&
    sides[1] + sides[2] > sides[0] &&
    sides[2] + sides[0] > sides[1]
  end
end

