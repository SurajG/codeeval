# Write a program to print out all the permutations of a string in alphabetical
# order.

def perms word
  return [] if word.size == 0
  return [word] if word.size == 1
  word.chars.each_with_index.map do |c,index|
    rest = word.dup
    rest.slice!(index)
    perms(rest).map do |perm|
      c + perm
    end
  end.flatten
end

File.open(ARGV[0]).map(&:strip).each do |word|
  puts perms(word).sort.join(',')
end
