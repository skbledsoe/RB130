=begin
return a list of all divisors of positive integer argument
list sequence does not matter

temp arr
from 1 to integer,
  put number in temp arr if integer modulo number == 0
return temp_arr


=end
def divisors(integer)
  1.upto(integer).select { |num| integer % num == 0 }
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute