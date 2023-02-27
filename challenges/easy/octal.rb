=begin
write a program that takes an octal integer and converts it into decimal output

data structure:
  input will be split and turned into integers, stored in array (reversed)
  result will be stored in an array and then summed

input: number string
output: integer (to_decimal method)

notes:
  input containing anything other than 0-7 will return 0

algo:
  create class Octal
    attr_reader for string

    initialize method
      takes string of digits
      assign string to string.to_i if not nil, otherwise assign to empty string

    to_decimal method
      return 0 unless number is valid
      initialize output array

      iterate over string.digits, access index
        append number * 8**index into output array
      return sum of output


    valid method
      replace everything 0-7 with ''
      valid if string is empty
      
=end

class Octal
  attr_reader :string

  def initialize(string)
    @string = string.nil? ? '' : string
  end

  def to_decimal
    return 0 unless valid?
    output = 0

    string.to_i.digits.each_with_index do |num, idx|
      output += num * (8**idx)
    end

    output
  end

  private

  def valid?
    string.gsub(/[0-7]/, '').empty?
  end
end



