=begin
write a program that takes two integers representing the month and the year, and
two strings representing a descriptor and day of the week, and returns a Date
object representing the date of the requested meetup.

input: strings and integers
output: Date object

notes:
  case of strings is not important
  days of the week strings will be sunday, monday, tuesday, etc
  descriptors are first, second, third, fourth, fifth, last, and teenth
    teenth are 13-19 days

methods:
  initialize(year, month)
  day(weekday, descriptor)

algo:
  create class Meetup
    attr_reader for year and month

    initialize method, takes integers for year and month
      assign @year to year and @month to month

    day method, takes weekday string and descriptor string
      convert descriptor method
      convert weekday to index position of weekday
      if descriptor is teenth, find_teenth method
      otherwise find_date method

    find_date method, descriptor and weekday
      dates_array method
      if descriptor is last, return last item in array
      otherwise return descriptor - 1 index place in array

    teenth_method, descriptor and weekday
      dates_array method
      select item if day is within 13-19 range

    dates array method, weekday integer
    **date step method???
      initialize dates array
      initialize day to 1
        while Date obj with year, month and day is valid
          append object into array if wday == weekday integer
          add 1 to day
      return dates array

    convert descriptor
      first => 1
      second => 2
      third => 3
      fourth => 4
      fifth => 5
      otherwise leave it

=end
require 'date'

class Meetup
  attr_reader :year, :month

  WEEKDAYS = %w(sunday monday tuesday wednesday thursday friday saturday)

  def initialize(year, month)
    @year = year
    @month = month
    @first_day = Date.new(year, month, 1)
    @last_day = Date.new(year, month, -1)
  end

  def day(wkday, desc)
    desc = convert_descriptor(desc)
    dates = dates_array(convert_weekday(wkday))

    desc == 'teenth' ? find_teenth(dates) : find_date(dates, desc)
  end

  private

  def find_date(date_arr, desc)
    return date_arr.last if desc == 'last'
    date_arr[desc - 1]
  end

  def find_teenth(date_arr)
    date_arr.select { |date| (13..19).include?(date.day) }[0]
  end

  def dates_array(wkday)
    dates = []
    @first_day.step(@last_day) do |date|
      dates << date if date.wday == wkday
    end
    dates
  end

  def convert_descriptor(desc)
    case desc.downcase
    when 'first'  then 1
    when 'second' then 2
    when 'third'  then 3
    when 'fourth' then 4
    when 'fifth'  then 5
    else               desc.downcase
    end
  end

  def convert_weekday(wkday)
    WEEKDAYS.index(wkday.downcase)
  end
end
