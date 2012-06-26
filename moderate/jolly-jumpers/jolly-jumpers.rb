# A sequence of n > 0 integers is called a jolly jumper if the absolute values
# of the differences between successive elements take on all possible values 1
# through n - 1. eg. 1 4 2 3 is a jolly jumper, because the absolute differences
# are 3, 2, and 1, respectively. The definition implies any sequence of a single
# integer is a jolly jumper.
#
# Your program should accept as its first argument a path to a filename. Each
# line in this file is one test case. Each test case will contain an integer n <
# 3000 followed by n integers representing the sequence. The integers are space
# delimited.

def jolly? seq
  n = seq.size - 1
  seen = Array.new(n, false)
  for d in (1..n) do
    diff = (seq[d] - seq[d - 1]).abs
    return false if diff < 1 || diff > n || seen[diff]
    seen[diff] = true
  end
  true
end

File.open(ARGV[0]).each_line do |line|
  seq = line.split(' ', 2)[1].split(' ').map(&:to_i)

  puts (jolly?(seq) ? 'Jolly' : 'Not jolly')
end
