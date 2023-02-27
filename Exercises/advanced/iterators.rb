=begin
create a new Enumerator object that can iterate over an infinite list of factorials.

then print the first 7 factorials by using an external iterator (a block), 
then print 3 more to see that the results won't be correct,
then reset using Enumerator#rewind and print 7 more factorials.

a factorial value is calculated by multiplying all integers from 1 to number
together. By definition, factorial of both 0 and 1 is 1.

algo:
  create enumerator object, pass in internal iteration block and yielder obj
    initialize num to 0
    begin a loop
      if num is less than 2, append num into yielder
      otherwise 
        inject 1..num, pass in :*
      add 1 to num

=end

factorial = Enumerator.new do |yielder|
  num = 0
  loop do
    elem = num == 0 ? 1 : (1..num).inject(:*)
    yielder << elem
    num += 1
  end
end

7.times { |num| puts "#{num}!: #{factorial.next}"}
puts
3.times { |num| puts "#{num}!: #{factorial.next}"}
puts
factorial.rewind
7.times { |num| puts "#{num}!: #{factorial.next}"}
puts

factorial.each_with_index do |el, idx|
  puts "#{idx}: #{el}"
  break if idx >= 6
end
