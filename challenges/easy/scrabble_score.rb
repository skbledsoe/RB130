=begin
write a program that takes a string, evaluates each letter to find each letter score, and returns the total scrabble score of the word.

input: string
output: integer (score method)

notes:
  create a collection in which to store the letters and their scores
  case insensitive
  non-alphabetic characters have no score


algo:
  create class Scrabble
    attr_reader for string
    hash container for letters and scores
      letters as keys, scores as values

    initialize method
      takes a string
      assign to instance variable @string

    score method (instance)
      initialize result to 0

      iterate over string chars
        add value of character key to result
        (result += hash[char])
      return result

    score method(string argument) (class)
      create new Scrabble object, pass in string
      call score method on object

=end

class Scrabble
  attr_reader :word

  SCORES = {'A'=>1, 'B'=>3, 'C'=>3, 'D'=>2, 'E'=>1, 'F'=>4, 'G'=>2, 'H'=>4, 'I'=>1,
            'J'=>8, 'K'=>5, 'L'=>1, 'M'=>3, 'N'=>1, 'O'=>1, 'P'=>3, 'Q'=>10, 'R'=>1,
            'S'=>1, 'T'=>1, 'U'=>1, 'V'=>4, 'W'=>4, 'X'=>8, 'Y'=>4, 'Z'=>10}

  def initialize(string)
    @word = string
  end

  def score
    result = 0
    if valid?
      word.upcase.chars.each do |char|
        result += SCORES[char]
      end
    end
    result
  end

  def self.score(string)
    Scrabble.new(string).score
  end

  private

  def valid?
    word != nil && word.gsub(/\W/, '') != ''
  end
end