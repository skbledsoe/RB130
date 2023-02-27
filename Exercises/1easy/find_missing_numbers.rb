=begin
temp arr
arr[0] up to arr[-1]
  next if elem included in array
  place elem in temp arr
return temp arr


=end



def missing(arr)
  temp_arr = []

  arr[0].upto(arr[-1]) do |elem|
    arr.include?(elem) ? next : temp_arr << elem
  end

  temp_arr.sort
end



p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []