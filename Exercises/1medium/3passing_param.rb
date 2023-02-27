items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*produce, wheat|
  puts "#{produce.join(', ')}"
  puts "#{wheat}"
end
puts
gather(items) do |fruit, *veggies, wheat|
  puts "#{fruit}"
  puts "#{veggies.join(', ')}"
  puts "#{wheat}"
end
puts
gather(items) do |fruit, *others|
  puts "#{fruit}"
  puts "#{others.join(', ')}"
end
puts
gather(items) do |fruit, corn, cabbage, wheat|
  puts "#{fruit}, #{corn}, #{cabbage}, and #{wheat}"
end