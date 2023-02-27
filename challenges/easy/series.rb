=begin
write a program that, given a string of digits and an integer, returns a nested 
array containing all possible integer consecutive digits

examples:
  '01234'
    3 digit series: [[012], [123], [234]]
    4 digit series: [[0123], [1234]]

notes:
  values in array are digits, not strings
  requesting 6-digit series from a 5-digit string throws ArgumentError

data structure:
  store split digit string in array
  store series result in array


algo:
  create class Series
    attr_reader for digits

    initialize method
      takes a string of digits
      convert to array of digits, store in @digits

    slices method (instance method)
      takes integer representing length of consecutive digits
      raises error if integer is larger than length of digits

      initialize output array
      initialize last_index to integer-1

      iterate over digits, access index
        append [index to last_index] into output array
        break if last_index == size of digits - 1
        add 1 to last_index
      return output array

=end

class Series
  attr_reader :digits

  def initialize(str)
    @digits = str.chars.map(&:to_i)
  end

  def slices(consecutive)
    raise ArgumentError, 'Invalid input' if consecutive > digits.length
    output = []
    digits.each_cons(consecutive) { |el| output << el }
    output
  end
end