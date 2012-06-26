# You are given two strings 'A' and 'B'. Print out a 1 if string 'B' occurs at
# the end of string 'A'. Else a zero.
#
# The first argument is a file, containing two strings, comma delimited, one per
# line. Ignore all empty lines in the input file, e.g.
#
# Hello World,World
# Hello CodeEval,CodeEval
# San Francisco,San Jose
#
# Print out 1 if the second string occurs at the end of the first string. Else
# zero. Do NOT print out empty lines between your output. e.g.
#
# 1
# 1
# 0

def endsWith? a, b
  return false if b.size > a.size
  b.reverse.chars.each_with_index do |char, index|
    if a[-(index + 1)] != char
      return false
    end
  end
  return true
end

File.open(ARGV[0]).each_line.reject{ |x| x.strip.empty? }.each do |line|
  a, b = line.split(',').map(&:strip)

  puts (endsWith?(a, b) ? 1 : 0)
end
