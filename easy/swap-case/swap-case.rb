# Write a program which swaps letters' case in a sentence. All non-letter
# characters should remain the same.

def swap_case(sentence)
  sentence.chars.map { |c| c.upcase == c ? c.downcase : c.upcase }.join('')
end

File.open(ARGV[0]).each_line do |line|
  puts swap_case(line)
end
