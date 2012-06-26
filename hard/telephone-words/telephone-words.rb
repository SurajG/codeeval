# Given a 7 digit telephone number, print out all the possible combination of
# letters that can represent the given telephone number. Note that in a standard
# 12 key pad, 0 and 1 do not have any letters associated with them. They are to
# br treated as such i.e. a 0/1 in the telephone number will be retained as such
# in the final word as well. You may use the following mapping between numbers
# and characters:
#
# 0 => 0
# 1 => 1
# 2 => abc
# 3 => def
# 4 => ghi
# 5 => jkl
# 6 => mno
# 7 => pqrs
# 8 => tuv
# 9 => wxyz
#
# Input sample:
#
# Your program should accept as its first argument a path to a filename. The
# input file contains 7 digit telephone numbers, one per line, e.g.
#
# 4155230

$digits_to_letters = %w[0 1 abc def ghi jkl mno pqrs tuv wxyz].map do |chars|
  chars.split //
end

def possible_letters number
  return [] if number.empty?

  letters = $digits_to_letters[number[0].to_i]
  return letters if number.size == 1

  sub_letters = possible_letters number[1..-1]
  letters.map do |c|
    sub_letters.map { |word| c + word }
  end.flatten
end

File.open(ARGV[0]).map(&:strip).each do |number|
  puts possible_letters(number).sort.join(',')
end
