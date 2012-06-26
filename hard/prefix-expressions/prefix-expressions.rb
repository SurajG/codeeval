# You are given a prefix expression. Write a program to evaluate it.
# Input sample:
#
# The first argument will be an input file with one prefix expression per line.
# e.g.
#
# * + 2 3 4
#
# Your program has to read this and insert it into any data structure you like.
# Traverse that data structure and evaluate the prefix expression. Each token is
# delimited by a whitespace. You may assume that the only valid operators
# appearing in test data are '+','*' and '/'
#
# Output sample:
#
# Print to stdout, the output of the prefix expression, one per line. e.g.
#
# 20

def parse_exprs tokens
  e1, rest = eval_prefix tokens
  e2, rest = eval_prefix rest
  [e1,e2,rest]
end

def eval_prefix tokens
  tok = tokens.first
  rest = tokens[1..-1]
  case tok
  when '*'
    e1, e2, rest = parse_exprs rest
    [e1 * e2, rest]
  when '+'
    e1, e2, rest = parse_exprs rest
    [e1 + e2, rest]
  when '/'
    e1, e2, rest = parse_exprs rest
    [e1 / e2, rest]
  else
    [tok.to_i, rest]
  end
end

File.open(ARGV[0]).each_line do |line|
  tokens = line.split(' ')

  puts eval_prefix(tokens).first
end
