=begin
  build a program that defines a custom set type and behaves like a set of
  unique elements that can be manipulated in different ways.

notes:
  all elements of this set must be numbers
  do not use Ruby's built-in Set type

data structure:
  array to hold elements

methods:
  initialize(arr=[] by default)
  empty?
    -returns true if set has no elements
  contains?(integer)
    -returns true if integer appears in set
  subset?(object)
    -returns true if argument set contains all of current set
    -always returns true if current set it empty
  disjoint?(object)
    -returns true if current and argument sets have no integers in common
  eql?(object)
    -compares current with object, both uniq and sorted
  add(integer)
    -adds integer to end of set
  intersection(object)
    -returns new object with integers that appear in both sets, uniq elements
  difference(object)
    -returns new object with integers that are in current set but not arg set
    -if current set is empty, returns object with empty set
    -if argument set is empty, returns object with original set
  union(object)
    -returns new object with combined sets, uniq elements

algo:
  create class CustomSet
    attr_reader for set

    initialize method, default arr to []
      assign set to arr

    empty?
      -returns true if set has no elements

    contains?(integer)
      -returns true if integer appears in set

    subset?(object)
      return true if current set is empty
      use all? to check if object's set contains each element

    disjoint?(object)
      -returns true if current and argument sets have no integers in common
      returns true if current set is empty
      use none? to check that object list doesn't contain current's elements

    eql?(object)
      compare current set with object set, both uniq and sorted

    add(integer)
      push integer into set

    intersection(object)
      initialize new_set to result of select current set,
        object set contains element?
        uniq result array
      create new set object and pass in new_set

    difference(object)
      initialize new_set to result of select current set,
        object does not contain element?
        uniq result array
      create new set object and pass in new_set

    union(object)
      initialize new_set to current set uniq + object set uniq, sorted
      create new set object and pass in new_set
=end
class CustomSet
  attr_reader :set

  def initialize(arr=[])
    @set = arr
  end

  def empty?
    set.empty?
  end

  def contains?(num)
    set.include?(num)
  end

  def subset?(other)
    set.all? { |el| other.contains?(el) }
  end

  def disjoint?(other)
    set.none? { |el| other.contains?(el) }
  end

  def eql?(other)
    set.uniq.sort == other.set.uniq.sort
  end

  def ==(other)
    eql?(other)
  end

  def add(num)
    set.push(num)
    self
  end

  def intersection(other)
    new_set = set.select { |el| other.contains?(el) }.uniq
    CustomSet.new(new_set)
  end

  def difference(other)
    new_set = set.reject { |el| other.contains?(el) }.uniq
    CustomSet.new(new_set)
  end

  def union(other)
    new_set = set.uniq + other.set.uniq
    CustomSet.new(new_set.sort)
  end
end
