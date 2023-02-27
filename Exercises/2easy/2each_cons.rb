def each_cons(array, args)
  array.each_with_index do |elem, idx|
    case args
    when 1
      yield(elem)
    when 2
      break if idx + 1 >= array.size
      yield(elem, array[idx + 1])
    when 3
      break if idx + 2 >= array.size
      yield(elem, array[idx+1], array[idx+2])
    when 4
      break if idx + 3 >= array.size
      yield(elem, array[idx+1], array[idx+2], array[idx+3])
    when 5
      break if idx + 4 >= array.size
      yield(elem, array[idx+1], array[idx+2], array[idx+3], array[idx+4])
    end
  end
  nil
end

# def each_cons(array, arg)
#   array.each_index do |index|
#     break if index + arg - 1 >= array.size
#     yield(*array[index..(index + arg - 1)])
#   end
#   nil
# end

hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash == {}