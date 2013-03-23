# You are given an encoded message containing only numbers. You are also
# provided with the following mapping:
#
# A : 1
# B : 2
# C : 3
# ...
# Z : 26
#
# Given an encoded message, count the number of ways it can be decoded.
# For example, 12 could be decoded as AB(1 2) or L(12). Hence the number
# of ways to decode 12 is 2.
#
# Your program should accept as its first argument a path to a filename. Each
# line in this file is a testcase and contains an encoded message of numbers.
# e.g.
#
# 12
# 123
# You may assume that the test cases contain only numbers.

$max_encoded_value = 26 # Highest possible encoded number

# Recursively consumes a variable number of characters to count the number of
# possible decodings
def count_possible_decodings(message)
  return 1 if message.nil? || message.empty? || message.length == 1

  possibilities = 0
  num_chars = 1
  loop do
    chars = message[0...num_chars]

    # Not enough characters for a bigger slice, or we have a leading zero
    break if chars.length != num_chars

    # Can't possibly be an encoded character
    break if chars.to_i > $max_encoded_value

    possibilities += count_possible_decodings(message[num_chars..-1])
    num_chars += 1
  end

  possibilities
end

File.open(ARGV[0]).each do |line|
  puts count_possible_decodings(line.strip)
end
