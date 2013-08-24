# Convert string representation of a set of numbers into integers.
#
# All numbers are separated by semicolon. There are up to 20 numbers in one
# line. The numbers are "zero" to "nine"

NUMBERS = {
  'zero'  => 0,
  'one'   => 1,
  'two'   => 2,
  'three' => 3,
  'four'  => 4,
  'five'  => 5,
  'six'   => 6,
  'seven' => 7,
  'eight' => 8,
  'nine'  => 9,
}

File.open(ARGV[0]).map(&:strip).each do |line|
  puts line.split(';').map { |word| NUMBERS[word] }.join
end
