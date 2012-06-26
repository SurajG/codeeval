# Given a positive integer, find the sum of its constituent digits.

File.open(ARGV[0]).each_line do |line|
  puts line.split('').inject(0) { |sum, d| sum + d.to_i }
end
