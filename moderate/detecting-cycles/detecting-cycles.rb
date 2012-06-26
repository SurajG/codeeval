# Given a sequence, write a program to detect cycles within it.
# Input sample:
#
# A file containing a sequence of numbers (space delimited). The file can have
# multiple such lines. e.g.
#
# 2 0 6 3 1 6 3 1 6 3 1
#
# Ensure to account for numbers that have more than one digit eg. 12. If there
# is no sequence, ignore that line.
#
# Output sample:
#
# Print to stdout the first sequence you find in each line. Ensure that there
# are no trailing empty spaces on each line you print. e.g.
#
# 6 3 1
#
# NOTE: Each sequence will have the property that the numbers can be generated
# by applying a function to the previous value. For example, x_i = f(x_i-1) for
# all i. Thus if a number m in the sequence is followed by the number n, then n
# will _always_ follow m whenever m appears in the sequence.

def find_cycle seq
  seen = {}

  seq.each_with_index do |x,i|
    return seq[seen[x]..i-1] if seen.has_key? x
    seen[x] = i
  end
  nil
end

File.open(ARGV[0]).map(&:strip).reject { |x| x.empty? }.each do |line|
  seq = line.split(' ').map(&:to_i)

  cycle = find_cycle(seq)
  puts cycle.join(' ') if cycle
end
