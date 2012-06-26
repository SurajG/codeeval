# Write a program to reverse the words of an input sentence.

File.open(ARGV[0]).each_line do |line|
  puts line.split.reverse.join ' '
end
