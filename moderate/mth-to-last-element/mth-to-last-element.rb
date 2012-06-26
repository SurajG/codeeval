# Write a program to determine the Mth to last element of a list.
#
# The first argument will be a text file containing a series of space delimited
# characters followed by an integer representing a index into the list(1 based),
# one per line, e.g.
#
# a b c d 4
# e f g h 2
#
# Print to stdout, the Mth element from the end of the list, one per line. If
# the index is larger than the list size, ignore that input, e.g.
#
# a
# g

File.open(ARGV[0]).each_line do |line|
  data = line.split(' ')
  list = data[0..-2]
  m = data[-1].to_i

  puts list[-m] if m <= list.size
end
