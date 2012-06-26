# Write a program implementing a stack inteface for integers.The interface
# should have 'push' and 'pop' functions. You will be asked to 'push' a series
# of integers and then 'pop' and print out every alternate integer.
#
# The first argument will be a text file containing a series of space delimited
# integers, one per line. e.g.
#
# 1 2 3 4
# 10 -2 3 4
#
# Print to stdout, every alternate integer(space delimited), one per line, e.g.
#
# 4 2
# 4 -2

class MyStack
  attr_accessor :list

  def initialize
    @list = []
  end

  def push value
    @list << value
  end

  def pop
    value = @list[-1]
    @list = @list[0..-2]
    value
  end
end

File.open(ARGV[0]).each_line do |line|
  ints = line.split(' ').map(&:to_i)

  stack = MyStack.new
  ints.each do |i|
    stack.push i
  end

  items = []
  ints.each do
    items << stack.pop
    stack.pop
  end

  puts items.join(' ')
end
