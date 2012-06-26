# The problem is as follows: choose a number, reverse its digits and add it to
# the original. If the sum is not a palindrome (which means, it is not the same
# number from left to right and right to left), repeat this procedure.
#
# Your program should accept as its first argument a path to a filename. Each
# line in this file is one test case. Each test case will contain an integer n <
# 4,294,967,295. Assume each test case will always have an answer and that it is
# computable with less than 1000 iterations (additions).
#
# For each line of input, generate a line of output which is the number of
# iterations (additions) to compute the palindrome and the resulting palindrome.
# (they should be on one line and separated by a single space character).

def pallindrome? n
  n.to_s == n.to_s.reverse
end

def iterations n
  iterations = 0
  while not pallindrome?(n)
    n = n + n.to_s.reverse.to_i
    iterations += 1
  end
  [iterations, n]
end

File.open(ARGV[0]).each_line do |line|
  n = line.to_i
  puts iterations(n).join(' ')
end
