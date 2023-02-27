# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')

=begin
  When we call the proc on line 5, the code executes even though there was no
  argument passed in. The parameter in the proc evaluated as nil and an empty string
  was printed when we called puts. When we call the proc on line 6 and pass in 'cat',
  the value of the argument is assigned to the parameter thing and is then printed
  to the screen. This shows that Procs have lenient arity, letting us call it with
  more or fewer arguments than it asks for.
=end

# # # Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
my_lambda.call
my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

=begin
  Lines 18 and 19 demonstrate that there are two different ways to create a lambda.
  Lines 20 and 21 show us that when we inspect a lambda, we can see that it is a type
  of Proc, and it's class is Proc, which is demonstrated on line 22.
  Line 23 will execute with no issues. The string argument passed in is assigned to
  the parameter thing and is printed to the screen. Line 24, however, results in an
  ArgumentError because the lambda is called without an argument. Lambdas have strict
  arity, so we have to pass in exactly the number of arguments it requires.
  Line 25 throws a NameError, because we are trying to call #new on Lambda, which
  is not a class. Lambdas are a type of Proc. Ruby searches for a constant called
  Lambda and does not find one.
=end

# # Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
block_method_1('seal')

=begin
  This demonstrates that, by including the yield keyword, we make blocks mandatory.
  Yield stops execution in the method, jumps to the block, and then jumps back to the
  method when the block is finished executing. This is why we get a LocalJumpError when
  no block is passed to this method.
=end

# # Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}

=begin
  Line 60 executes as we would expect. 
  On line 61, the block defines two parameters, but we only pass in one string
  argument. Because blocks have lenient arity, no errors are thrown. Instead, the 
  arguments are assigned to parameters in the order they are passed in, which is
  why the string argument gets assigned to the first parameter. Extra parameters
  are assigned to nil, and extra arguments are ignored. When the puts statement
  is printed to the screen, the seal parameter evaluates as an empty string.
  line 64 results in a NameError. Because there are no parameters defined, ruby
  looks for a local variable called animal. When it doesn't find it, it looks for
  a method called animal. When nothing is found, Ruby thrown that NameError.
=end

=begin
While Procs and lambdas can be saved to a local variable, blocks cannot. 
Procs and blocks have lenient arity, while lambdas and methods have strict arity.
=end