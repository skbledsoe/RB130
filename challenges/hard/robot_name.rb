=begin
build a program that generates a random robot name upon instantiation.

notes:
  -names consist of two uppercase letters and three digits (RX837 or BC811)
  -names must be random
  -no name should be used twice, so they need to be kept track of

input: n/a
output: string

data structure:
  array to contain used names

methods:
  initialize
    creates a new name
  name
    returns value of name
  reset
    resets name by creating new instance

algo:
  create class Robot
    initialize used_names array

    attr_reader for name

    initialize method
      call the reset method

    reset
      assign name to generate_name

    generate_name method
      initialize output string to ''

      add a random uppercase letter to string twice
      add a random digit to string twice

      if string occurs in used_names array, reset
      otherwise return string
=end
class Robot
  @@used_names = []

  attr_reader :name

  def initialize
    @name = generate_name
  end

  def reset
    @@used_names.delete(name)
    initialize
  end

  private

  def generate_name
    new_name = letters + numbers

    if @@used_names.include?(new_name)
      reset
    else
      @@used_names.push(new_name)
    end

    @@used_names.last
  end

  def letters
    letters = ''
    2.times { letters << ('A'..'Z').to_a.sample }
    letters
  end

  def numbers
    numbers = ''
    3.times { numbers << ('0'..'9').to_a.sample }
    numbers
  end
end