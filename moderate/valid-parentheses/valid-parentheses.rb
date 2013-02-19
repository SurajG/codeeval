# Given a string comprising just of the characters (,),{,},[,] determine if it
# is well-formed or not.

require 'set'

PARENS = { '(' => ')', '{' => '}', '[' => ']' }

def valid_parentheses?(str, opened = [])
  # Valid if reached the end of string and there are no parens left to be closed
  return opened.empty? if str.empty?

  case str[0]
  when *PARENS.keys
    return valid_parentheses?(str[1..-1], opened + [str[0]])
  when *PARENS.values
    return PARENS[opened.last] == str[0] && valid_parentheses?(str[1..-1], opened[0..-2])
  end
end

File.open(ARGV[0]).map(&:strip).each do |line|
  puts valid_parentheses?(line.strip).to_s.capitalize
end
