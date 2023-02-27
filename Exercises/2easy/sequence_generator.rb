def step(start, last, increment)
  number = start
  loop do
    yield(number) if block_given?
    break if number + increment > last
    number += increment
  end
  number
end

step(1, 10, 3) { |value| puts "value = #{value}" }
p step(1, 10, 3)