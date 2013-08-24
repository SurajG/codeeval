# You have a set of rows with names of famous writers encoded inside. Each row
# is divided into 2 parts by pipe char (|). The first part has a writer's name.
# The second part is a "key" to generate a name.
#
# Your goal is to go through each number in the key (numbers are separated by
# space) left-to-right. Each number represents a position in the 1st part of a
# row.

File.open(ARGV[0]).each_line do |line|
  code, positions = line.split('|')
  positions = positions.split.map(&:to_i)

  puts positions.map { |i| code[i - 1] }.join
end
