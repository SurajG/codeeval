# You are given a number N and a string S. Print all of the possible ways to
# write a string of length N from the characters in string S, comma delimited in
# alphabetical order.
# Input sample:
#
# The first argument will be the path to the input filename containing the test
# data. Each line in this file is a separate test case. Each line is in the
# format: N,S i.e. a positive integer, followed by a string (comma separated)
# eg.
#
# 1,aa
# 2,ab
# 3,pop
#
# Output sample:
#
# Print all of the possible ways to write a string of length N from the
# characters in string S comma delimited in alphabetical order, with no
# duplicates. eg.
#
# a
# aa,ab,ba,bb
# ooo,oop,opo,opp,poo,pop,ppo,ppp

require 'set'

def generate_strings chars, n
  return [''] if n == 0

  strings = []
  chars.each do |c|
    strings += generate_strings(chars, n - 1).map { |cs| c + cs }
  end

  strings
end

File.open(ARGV[0]).map{ |line| line.strip.split(',') }.each do |n,s|
  puts generate_strings(s.chars.to_a.uniq.sort, n.to_i).sort.join(',')
end
