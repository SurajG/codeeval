# You are given two strings. Determine if the second string is a substring of
# the first (Do NOT use any substr type library function). The second string may
# contain an asterisk(*) which should be treated as a regular expression i.e.
# matches zero or more characters. The asterisk can be escaped by a \ char in
# which case it should be interpreted as a regular '*' character. To summarize:
# the strings can contain alphabets, numbers, * and \ characters.
#
# Input sample:
#
# File containing two comma delimited strings per line. e.g.
#
# Hello,ell
# This is good, is
# CodeEval,C*Eval
# Old,Young
#
# Output sample:
#
# If the second string is indeed a substring of the first, print out a
# 'true'(lowercase), else print out a 'false'(lowercase), one per line.
# e.g.
#
# true
# true
# true
# false

def matches pattern, str
  return true if pattern.nil? || pattern.empty?
  return false if str.nil? || str.empty?

  if pattern[0] == '\\' and pattern[1] == '*'
    return true if str[0] == '*' &&
      matches(pattern[2..pattern.size], str[1..str.size])
  end

  if pattern[0] == '*'
    for i in (1..str.size) do
      return true if matches(pattern[1..pattern.size], str[i..str.size])
    end
  end

  pattern = pattern[1..pattern.size] if pattern[0] == str[0]
  matches(pattern, str[1..str.size])
end

File.open(ARGV[0]).map(&:strip).map{ |line| line.split(',') }.each do |str,pat|
  puts matches(pat, str)
end
