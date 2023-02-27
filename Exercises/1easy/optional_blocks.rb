def compute(arg)
  block_given? ? yield(arg) : "Does not compute."
end

# p compute { 5 + 3 } == 8
# p compute { 'a' + 'b' } == 'ab'
# p compute == 'Does not compute.'

p compute(1) { |num| num + num }
p compute('a') { |ltr| ltr.upcase }
p compute('hello')