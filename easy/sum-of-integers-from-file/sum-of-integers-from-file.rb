# Print out the sum of integers read from a file.

puts File.open(ARGV[0]).each_line.inject(0) { |sum, line| line.to_i + sum }
