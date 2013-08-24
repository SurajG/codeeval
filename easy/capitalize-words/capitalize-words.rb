# Write a program which capitalizes words in a sentence.

def capitalize_words(sentence)
  sentence.split.map{ |word| word[0].upcase + word[1..-1] }.join(' ')
end

File.open(ARGV[0]).each_line do |line|
  puts capitalize_words(line)
end
