# Write a program to determine the number of 1 bits in the internal
# representation of a given integer.

def num_ones n
  ones = 0
  while n > 0
    ones += 1 if n & 1 == 1
    n >>= 1
  end
  ones
end

File.open(ARGV[0]).each_line do |line|
  n = line.to_i
  puts num_ones(n)
end
