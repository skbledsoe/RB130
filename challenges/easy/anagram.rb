=begin
write a program that takes a string upon initiation and an array of strings in a #match method and returns an array containing the strings which are anagrams of the original string.

input: string (constructor); array of strings (match method)
output: array of strings

notes:
  if there are no matches, return empty array
  identical words are not anagrams
  

algo:
  create class Anigram
    attr_reader for word

    initialize method
      takes a string
      assign string to instance variable @word

    match method
      takes array of strings
      initialize result to empty array

      iterate over strings array
        if word.downcase.sort == string.downcase.sort AND
          word.downcase does not equal string.downcase
            append string into result array
      
      return result array

=end

class Anagram
  attr_reader :word

  def initialize(string)
    @word = string
  end

  def match(array)
    result = []

    array.each do |string|
      if word.downcase.chars.sort == string.downcase.chars.sort &&
         word.downcase != string.downcase
         result << string
      end
    end
    result
  end
end