=begin
write a program that takes an optional set of numbers at instantiation and a natural number (to method) and finds the sum of all the multiples of the numbers in the set that are less than the natural number.

notes:
  if set of numbers is not given, default to 3, 5
  
example:
  set: 3, 5
  natural number: 20
  multiples: 3, 5, 6, 9, 10, 12, 15, 18
  sum: 78

data structures:
  array for set of numbers
  array for multiples

algo:
  create class Sum
    attr_reader for set

    initialize method
      default arg [3, 5], assign to @set

    to method (instance)
      takes natural number
      initialize multiples to empty array

      from 1...natural number, |current|
        iterate through set array, |divisor|
          if current % divisor is 0, append to multiples array
      return sum of multiples array

    to method (class)
      takes natural number
      call to instance method on new instance of Sum and pass natural number

=end

class SumOfMultiples
  attr_reader :set

  def initialize(*set)
    @set = set.empty? ? [3, 5] : set
  end

  def self.to(natural_num)
    SumOfMultiples.new.to(natural_num)
  end

  def to(natural_num)
    multiples = []

    (1...natural_num).each do |current|
      set.each do |divisor| 
        next if multiples.include?(current)
        multiples << current if current % divisor == 0
      end
    end
    multiples.sum
  end
end
