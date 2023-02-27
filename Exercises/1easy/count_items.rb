def count(collection)
  count = 0
  collection.each { |val| count += 1 if yield(val) }
  count
end

#no each, loop, while, or until
def count(collection)
  count = 0
  for val in collection do
    count += 1 if yield(val)
  end
  count
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2