# Given a number n and two integers p1,p2 determine if the bits in position p1
# and p2 are the same or not. Positions p1,p2 are 1-based.

File.open(ARGV[0]).each_line do |line|
  n, p1, p2 = line.split(',').map(&:to_i)
  b1, b2 = [p1, p2].map { |p| (n >> p - 1) & 1 }
  puts b1 == b2
end
