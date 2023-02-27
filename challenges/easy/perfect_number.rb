=begin
write a program that takes an integer and compares it to the sum of its positive divisors (the aliquot sum) and returns a string identifying its category:

perfect - aliquot sum equal to the original number
abundant - aliquot sum greater than the original number
deficient - aliquot sum less than original number

notes:
  negative numbers should raise StandardError

examples:
  6 - perfect, divisors are 1, 2, and 3 (1 + 2 + 3 = 6)
  15 - deficient, divisors are 1, 3, 5 (1 + 3 + 5 = 9)
  24 - abundant, divisors are 1, 2, 3, 4, 6, 8, and 12 (equals 36)
  prime numbers are always deficient, only divisor is 1

algo:
  create class PerfectNumber
    attr_reader for number

    classify method
      takes integer assign to number
      raise StandardError if number < 0
      if divisors > number, return abundant
      if divisors == number, return perfect,
      if divisors < number, return deficient

    divisors method
      initialize result to 0
      from 1 to number |divisor|
        add divisor to result if remainder of number % divisor is 0
      return result

=end

class PerfectNumber
  def self.classify(number)
    raise StandardError.new if number < 1

    case number <=> divisor(number)
    when -1 then 'abundant'
    when 0  then 'perfect'
    when 1  then 'deficient'
    end
  end

  class << self
    private

    def divisor(number)
      result = 0
      1.upto(number - 1) do |num|
        result += num if number % num == 0
      end
      result
    end
  end
end
