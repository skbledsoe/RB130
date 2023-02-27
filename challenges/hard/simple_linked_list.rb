=begin
write a program that creates a singly linked list of elements. Each element only
knows about the next element in the list, but no others.

input: integers and Element objects

notes:
  elements in list will contain numbers 1-10
  last in, first out rule

methods:
  LinkedList:
    initialize
    size - number of elements in list
    empty? - checks if empty
    peek - returns datum of first element
    push(num) - adds element with num datum to list
    head - returns first element
    pop - removes first element from list and returns its datum
    *from_a(arr) - creates list using nums in array, stays in arr order
    to_a - returns array of datums of elements in list
    reverse - reverses elements in list

  Element:
    initialize(num, next element) - num assigned to datum, next default to nil
    datum - returns value of datum
    tail? - returns true/false if next is nil
    next - returns next element

algo:
  create class Element
    attr_reader for datum and next

    initialize method, takes integer and optional next element, default nil
      assign datum to integer
      assign next to next

    tail? method
      returns true unless next is true

  create class LinkedList
    attr_reader for list and head

    initialize method
      initialize list to empty array
      initialize head to first item in array

    size method
      return size of list

    empty? method
      returns true if list is empty

    peek
      return datum of head of list

    push method, takes integer
      assign head to head of list
      create Element object with integer as datum head as next
      add element to beginning of list
      reassign head to new element

    pop method
      initialize current element to head of list
      initialize head to next of current element
      delete current element from list and return it

    to_a method
      return array of datums of elements, use select method?

    reverse method
      create new list object
      iterate through current list
        create new element, pass in datum of current and head of new list
        push new element into new list
      return new list

    **from_a method, takes array
      create new list object
      iterate through reverse array
        create new element, pass current number and head of new list
        push new element into new list
      return new list
=end
class Element
  attr_reader :datum

  def initialize(datum, next_elem=nil)
    @datum = datum
    @next_elem = next_elem
  end

  def next
    @next_elem
  end

  def tail?
    @next_elem ? false : true
  end
end

class SimpleLinkedList
  attr_reader :head

  def size
    size = 0
    current_elem = head
    while current_elem
      size += 1
      current_elem = current_elem.next
    end
    size
  end

  def empty?
    head.nil?
  end

  def peek
    head&.datum
  end

  def push(datum)
    new_element = Element.new(datum, head)
    @head = new_element
  end

  def pop
    current_elem = head
    @head = current_elem.next
    current_elem.datum
  end

  def to_a
    list = []
    current_elem = head
    while current_elem
      list << current_elem.datum
      current_elem = current_elem.next
    end
    list
  end

  def reverse
    new_list = SimpleLinkedList.new
    current_elem = head
    while current_elem
      new_list.push(current_elem.datum)
      current_elem = current_elem.next
    end
    new_list
  end

  def self.from_a(arr)
    arr = [] if arr.nil?
    new_list = new
    arr.reverse.each do |datum|
      new_list.push(datum)
    end
    new_list
  end
end
