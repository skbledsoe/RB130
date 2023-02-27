=begin
create a program that takes 1..2 integers representing the hour and minute, adds
or subtracts minutes from it, and returns the time in string form

input: integers
output: string

methods:
  at *class method
  to_s
  +
  -
  ==

algo:
  create class Clock
    attr_reader for hour and minute

    at class method, takes 1..2 integers
      create new clock instance, pass in hour and minute

    initialize method, takes hour and minute
      regulate time by mult hour by 60, add to minutes, modulo by 1440
      assign hour and minute to time divmod by 60

    - method, takes integer
      create new clock instance, pass in hour and minute - minutes passed in

    + method
      create new clock instance, pass in hour and minute + minutes passed in

    to_s method
      format hour and minute to 2 digits, separated by :

    == method
      compare hour to other hour and minute to other minute

=end

class Clock
  attr_reader :hour, :minute

  def initialize(hour, minute)
    time = ((hour * 60) + minute) % 1440
    @hour, @minute = time.divmod(60)
  end

  def self.at(hour, minute=0)
    new(hour, minute)
  end

  def -(minutes)
    Clock.new(hour, minute - minutes)
  end

  def +(minutes)
    Clock.new(hour, minute + minutes)
  end

  def ==(other)
    hour == other.hour && minute == other.minute
  end

  def to_s
    "#{'%02d' % hour}:#{'%02d' % minute}"
  end
end