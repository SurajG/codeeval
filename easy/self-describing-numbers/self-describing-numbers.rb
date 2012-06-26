# A number is a self-describing number when (assuming digit positions are
# labeled 0 to N-1), the digit in each position is equal to the number of times
# that that digit appears in the number.

def self_describing? n
  digits = n.to_s.chars.map { |d| d.to_i }
  return false if digits.size > 10
  counts = Array.new(10, 0)
  digits.each { |d| counts[d] += 1 }
  (0..digits.size-1).none? { |i| counts[i] != digits[i] }
end

File.open(ARGV[0]).each_line do |line|
  puts self_describing?(line.to_i) ? 1 : 0
end
