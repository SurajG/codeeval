# A happy number is defined by the following process. Starting with any positive
# integer, replace the number by the sum of the squares of its digits, and
# repeat the process until the number equals 1 (where it will stay), or it loops
# endlessly in a cycle which does not include 1. Those numbers for which this
# process ends in 1 are happy numbers, while those that do not end in 1 are
# unhappy numbers.

def happy? n
  visited = []
  until n == 1 || visited.include?(n)
    visited << n
    n = n.to_s.chars.map{ |x| x.to_i * x.to_i }.inject{ |sum, x| sum + x }
  end
  n == 1
end

File.open(ARGV[0]).each_line do |line|
  puts happy?(line.to_i) ? 1 : 0
end
