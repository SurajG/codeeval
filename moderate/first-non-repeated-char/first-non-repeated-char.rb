# Write a program to find the first non repeated character in a string.
# Input sample:
#
# The first argument will be a text file containing strings. e.g.
#
# yellow
# tooth
#
# Output sample:
#
# Print to stdout, the first non repeating character, one per line.
# e.g.
#
# y
# h

File.open(ARGV[0]).each_line do |line|
  chars = Hash.new { |h,k| h[k] = 0 }

  line.chars.each do |c|
    chars[c] += 1
  end

  for c in line.chars do
    if chars[c] == 1
      puts c
      break
    end
  end
end
