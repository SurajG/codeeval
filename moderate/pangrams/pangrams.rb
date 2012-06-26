# The sentence 'A quick brown fox jumps over the lazy dog' contains every single
# letter in the alphabet. Such sentences are called pangrams. You are to write a
# program, which takes a sentence, and returns all the letters it is missing
# (which prevent it from being a pangram). You should ignore the case of the
# letters in sentence, and your return should be all lower case letters, in
# alphabetical order. You should also ignore all non US-ASCII characters.In case
# the input sentence is already a pangram, print out the string NULL
#
# Your program should accept as its first argument a filename. This file will
# contain several text strings, one per line. Ignore all empty lines, e.g.
#
# A quick brown fox jumps over the lazy dog
# A slow yellow fox crawls under the proactive dog
#
# Print out all the letters each string is missing in lowercase, alphabetical
# order, e.g.
#
# NULL
# bjkmqz

File.open(ARGV[0]).each_line.map(&:strip).reject{ |x| x.empty? }.each do |line|
  sentence = line.downcase

  seen = Array.new(26, false)
  sentence.chars.each do |char|
    ord = char.ord
    if ord >= 'a'.ord and ord <= 'z'.ord
      seen[ord - 'a'.ord] = true
    end
  end

  none_printed = true
  for i in 0..seen.size-1
    if not seen[i]
      print (i + 'a'.ord).chr
      none_printed = false
    end
  end
  print 'NULL' if none_printed
  print "\n"
end
