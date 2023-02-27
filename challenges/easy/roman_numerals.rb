=begin
write a program that takes an integer and converts it into roman numerals

input: integer
output: string (to_roman method)

notes:
  letters used are I(1), V(5), X(10), L(50), C(100), D(500), M(1000)
  no need to convert numbers higher than 3000
  each digit is separately expressed starting with the leftmost digit and skipping 0:
    1990 = MCMXC: 
      M (1000)
      CM (900)
      XC (90)

    2008 = MMVIII:
      MM (2000)
      VIII (8)
  

algo:
  create class RomanNumerals
    attr_reader for number

    hash containing 1, 4, 5, 9, 10, 40, 50, 90, 100, 400, 500, 900, 1000 keys and 
                    matching Roman Numberals as values

    initialize method
      takes integer, assign to @number

    to_roman instance method
      initialize output string to ''

      iterate over hash
        if key is less than number,
          add value of key to string (number/key) number of times
          subtract (number/key) * key from number
      return string 

=end

class RomanNumeral
  attr_reader :number

  CONVERSION = { 1000=> 'M',
                 900=>  'CM',
                 500=>  'D',
                 400=>  'CD',
                 100=>  'C',
                 90=>   'XC',
                 50=>   'L',
                 40=>   'XL',
                 10=>   'X',
                  9=>   'IX',
                  5=>   'V',
                  4=>   'IV',
                  1=>   'I' 
                }
  
  def initialize(number)
    @number = number
  end

  def to_roman
    output = ''
    num = number

    CONVERSION.each_pair do |key, roman|
      if key <= num
        divisor = num/key
        divisor.times { output << roman }
        num -= (divisor * key)
      end
    end
    output
  end
end
