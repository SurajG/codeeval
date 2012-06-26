# Write a program to read a multiple line text file and write the 'N' longest
# lines to stdout.
#
# Your program should read an input file (the first argument to your program).
# The first line contains the value of the number 'N' followed by multiple
# lines. You may assume that the input file is formatted correctly and the
# number on the first line i.e. 'N' is a valid positive integer.

def kbest list, k
  p = list[rand(list.size)].size
  l, r = list.partition { |i| i.size < p }
  if r.size <= k
    r.sort { |a,b| b.size <=> a.size } +
      (r.size < k ? kbest(l, k - r.size) : [])
  else
    kbest r, k
  end
end

File.open(ARGV[0]) do |f|
  n = f.readline.to_i
  words = f.readlines.map(&:strip)
  puts kbest(words, n)
end
