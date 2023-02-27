=begin
Build a program that, given two strings representing DNA, calculates the hamming distance (number of differences that occur in the strings).

Example:
  GAGCCTACTAACGGGAT
  CATCGTAATGACGGCCT
  ^ ^ ^  ^ ^    ^^      7 differences, hamming distance = 7

notes:
  if strings are different sizes, calculate up to the length of the shorter string
  string can be empty

input: string
output: integer

data structure:
  strings

algo:
  DNA class
    initialize method
      takes a string as argument
      assign string to @dna instance variable

    hamming_distance method
      takes a second dna string as argument
      initialize distance variable to 0
      initialize size variable to length of shortest string
        [dna.size, other_dna.size].min
      loop size times, index as parameter
        next if index of dna == index of other_dna
        add 1 to distance
      end loop
      return distance

=end

class DNA 
  attr_reader :dna

  def initialize(dna)
    @dna = dna
  end

  def hamming_distance(other_dna)
    size = [dna.size, other_dna.size].min
    distance = 0

    size.times do |idx|
      distance += 1 unless dna[idx] == other_dna[idx]
    end
    
    distance
  end
end

