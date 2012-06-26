# The first argument will be a text file containing an input string followed by
# a comma and then the characters that need to be scrubbed. e.g.
#
# how are you, abc
# hello world, def
#
# Print to stdout, the scrubbed strings, one per line. Trim out any
# leading/trailing whitespaces if they occur.
# e.g.
#
# how re you
# hllo worl

require 'set'

File.open(ARGV[0]).each_line do |line|
  str, chars = line.split(',').map(&:strip)
  chars = Set.new chars.chars

  puts str.chars.reject { |c| chars.include? c }.join
end
