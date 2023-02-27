=begin
write a program that takes an integer and returns the corresponding verse number of the beer song

input: integer (verse / verses method)
output: string (verse / verses method)

notes:
  lines separated by \n

algo:
  create class BeerSong

  verse (class method)
    takes an integer
    puts display(integer)

  verses (class method)
    takes a few verses as arguments, store in array
    iterate over array, |verse|
      puts display(verse)


  lyrics (class method)
    from 99 down to 0, |verse|
    puts display(verse)


  display(verse)
    initialize bottles to verse
    initialize less_bottles to verse-1

    if bottles is 0,
      final verse of song here
    otherwise
      less_bottles is 'no more' if less_bottles is 0
      verse of song here, with bottles & less_bottles interpolated

=end

class BeerSong
  def self.verse(verse)
    display(verse)
  end

  def self.verses(first, last)
    output = ''

    first.downto(last) do |verse|
      output << display(verse)
      output << "\n" if verse > last
    end

    output
  end

  def self.lyrics
    verses(99,0)
  end

  class << self
    private

    def display(verse)
      bottles = verse
      less_bottles = verse - 1

      if bottles == 2
        "#{bottles} bottles of beer on the wall, #{bottles} bottles of beer.\n" + 
        "Take one down and pass it around, #{less_bottles} bottle of beer" +
        " on the wall.\n"
      elsif bottles == 1
        "#{bottles} bottle of beer on the wall, #{bottles} bottle of beer.\n" +
        "Take it down and pass it around, no more bottles of beer" +
        " on the wall.\n"
      elsif bottles == 0
        "No more bottles of beer on the wall, no more bottles of beer.\n" +
        "Go to the store and buy some more, 99 bottles of beer" +
        " on the wall.\n"
      else
        "#{bottles} bottles of beer on the wall, #{bottles} bottles of beer.\n" +
        "Take one down and pass it around, #{less_bottles} bottles of beer" +
        " on the wall.\n" 
      end
    end
  end
end
