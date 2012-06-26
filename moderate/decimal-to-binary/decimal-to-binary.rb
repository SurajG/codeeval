# Given a decimal (base 10) number, print out its binary representation.
#
# File containing positive whole decimal numbers, one per line. e.g.
#
# 2
# 10
# 67
#
# Print the decimal representation, one per line. e.g.
#
# 10
# 1010
# 1000011

File.open(ARGV[0]).each_line do |line|
  n = line.to_i

  digits = []
  begin
    digits << (n & 1)
    n >>= 1
  end while n > 0

  puts digits.reverse.join
end
