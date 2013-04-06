# Given a string s, little Johnny defined the beauty of the string as the sum of
# the beauty of the letters in it. The beauty of each letter is an integer
# between 1 and 26, inclusive, and no two letters have the same beauty. Johnny
# doesn't care about whether letters are uppercase or lowercase, so that doesn't
# affect the beauty of a letter.
#
# What is the maximum possible beauty of a string?

def max_beauty(string)
  chars = Hash.new { |h,k| h[k] = 0 }

  string.chars.each do |char|
    chars[char] += 1
  end

  next_value = 26
  beauty = 0
  chars.sort_by { |key, value| -value }.each do |_, count|
    beauty += count * next_value
    next_value -= 1
  end

  beauty
end

File.open(ARGV[0]).map(&:strip).each do |line|
  letters = line.downcase.gsub(/[^a-z]/, '')
  puts max_beauty(letters)
end
