#times method

def times(n)
  counter = 0

  while counter < n
    yield(counter)
    counter += 1
  end

  n
end

times(5) do |num|
  puts num
end

# #each method
def each(array)
  counter = 0

  while counter < array.size
    yield(array[counter])
    counter += 1
  end

  array
end

each([1, 2, 3, 4, 5]) do |num|
  puts num
end

#select method
def select(arr)
  result = []
  counter = 0

  while counter < arr.size
    result << arr[counter] if yield(arr[counter])
    counter += 1
  end

  result
end

array = [1, 2, 3, 4, 5]
p select(array) { |num| num.odd? }
p select(array) { |num| puts num }
p select(array) { |num| num + 1 }

#reduce method
def reduce(arr, default=arr[0])
  counter = 0
  acc = default

  while counter < arr.size
    acc = yield(acc, arr[counter])
    counter += 1
  end

  acc
end

p reduce(array) { |acc, num| acc + num }
p reduce(array, 10) { |acc, num| acc + num }
# p reduce(array) { |acc, num| acc + num if num.odd? }
