=begin
write a program that takes a letter and outputs a diamond shape from 'A' to
given letter and back to 'A'.

notes:
  -height and width of diamond is double the number place of the letter -1
    -can find number in alphabet by subtracting 64 from letter.ord
  -first/last row each contain one 'A', the other rows contain two of each ltr
  -each row will be centered by double number place -1
  -spaces begin at one for letter 'B' and increase by two for following letters
  -no test cases for lowercase letters, may want to have a guard clause

input: string
output: string (joined array)

data structure:
  array to hold each line, separated by \n

methods:
  make_diamond(letter) *class method

algo:
  create class Diamond
    make_diamond method, takes a letter
      initialize space to 1
      map from 'A' to letter,
        add 2 to space unless current letter is 'A' or 'B'
        format_line(letter, space)
    join return value of map

    format_line method, takes a letter and space
      initialize size to double ord of letter - 1
      if letter is 'A',
        return string with 'A' centered by size, + \n
      otherwise
        return 'letter, space, letter' centered by size + \n
=end

=begin

***create an instance of Diamond***

class Diamond
  attr_reader :size, :letter

  def initialize(letter)
    @letter = letter
    @size = ((letter.upcase.ord - 64) * 2) - 1
  end

  def self.make_diamond(letter)
    new(letter).output_diamond
  end

  def output_diamond
    format_diamond
  end

  private

  def format_diamond
    space = 1
    arr = letter == letter.upcase ? ('A'..letter).to_a : ('a'..letter).to_a

    arr.map! do |ltr|
      space += 2 unless ltr.upcase < 'C'
      format_line(ltr, space)
    end

    (arr + arr.reverse[1..-1]).join
  end

  def format_line(ltr, space)
    if ltr == 'A' || ltr == 'a'
      ltr.center(size) << "\n"
    else
      "#{ltr}#{(' ' * space)}#{ltr}".center(size) << "\n"
    end
  end
end
=end
class Diamond
  def self.make_diamond(letter)
    space = 1
    center = ((letter.upcase.ord - 64) * 2) - 1
    arr = letter == letter.upcase ? ('A'..letter).to_a : ('a'..letter).to_a

    arr.map! do |ltr|
      space += 2 unless ltr.upcase < 'C'
      format_line(ltr, space, center)
    end

    (arr + arr.reverse[1..-1]).join
  end

  class << self
    private

    def format_line(ltr, space, size)
      if ltr == 'A' || ltr == 'a'
        ltr.center(size) << "\n"
      else
        "#{ltr}#{(' ' * space)}#{ltr}".center(size) << "\n"
      end
    end
  end
end
