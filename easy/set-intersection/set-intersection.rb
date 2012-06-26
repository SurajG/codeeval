# You are given two sorted list of numbers(ascending order). The lists
# themselves are comma delimited and the two lists are semicolon delimited.
# Print out the intersection of these two sets.

File.open(ARGV[0]).each_line do |line|
  s1, s2 = line.split(';').map { |s| s.split(',').map(&:to_i) }
  puts (s1 & s2).join(',')
end
