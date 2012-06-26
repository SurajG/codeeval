# The Fibonacci series is defined as: F(0) = 0; F(1) = 1; F(n) = F(n-1) + F(n-2)
# when n>1. Given a positive integer 'n', print out the F(n).

def fib n
  return n if n < 2
  fib(n - 1) + fib(n - 2)
end

File.open(ARGV[0]).each_line do |line|
  puts fib(line.to_i)
end
