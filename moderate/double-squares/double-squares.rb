# A double-square number is an integer X which can be expressed as the sum of
# two perfect squares. For example, 10 is a double-square because 10 = 3^2 +
# 1^2. Your task in this problem is, given X, determine the number of ways in
# which it can be written as the sum of two squares. For example, 10 can only be
# written as 3^2 + 1^2 (we don't count 1^2 + 3^2 as being different). On the
# other hand, 25 can be written as 5^2 + 0^2 or as 4^2 + 3^2.
#
# NOTE: Do NOT attempt a brute force approach. It will not work. The following
# constraints hold:
#
# 0 <= X <= 2147483647
# 1 <= N <= 100
#
# You should first read an integer N, the number of test cases. The next N lines
# will contain N values of X.
#
# Input sample:
#
# 5
# 10
# 25
# 3
# 0
# 1
#
# Output sample:
#
# 1
# 2
# 0
# 1
# 1

require 'set'

File.open(ARGV[0]) do |f|
  n = f.readline.to_i
  xs = f.lines.map(&:to_i)

  squares = Set.new
  for i in 0..(Math.sqrt(xs.max).floor)
    squares.add i * i
  end

  xs.each do |x|
    num_ways = 0
    i = 0
    while i <= Math.sqrt(x/2)
      num_ways += 1 if squares.member?(x - i*i)
      i += 1
    end
    puts num_ways
  end
end
