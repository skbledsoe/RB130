def zip(arr1, arr2)
  result_arr = []
  0.upto((arr1.size)-1) do |idx|
    result_arr << [arr1[idx], arr2[idx]]
  end
  result_arr
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]