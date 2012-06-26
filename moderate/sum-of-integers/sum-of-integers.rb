# Write a program to determine the largest sum of contiguous integers in a list.
#
# The first argument will be a text file containing a comma separated list of
# integers, one per line, e.g.
#
# -10, 2, 3, -2, 0, 5, -15
# 2,3,-2,-1,10
#
# Print to stdout the largest sum. In other words, of all the possible
# contiguous subarrays for a given array, find the one with the largest sum, and
# print that sum, e.g. for the input above, the output would be:
#
# 8
# 12

File.open(ARGV[0]).each_line do |line|
  ints = line.split(',').map(&:to_i)

  best_sum = best_with_last = 0
  ints.each do |a|
    best_with_last = [best_with_last + a, 0].max

    # Best sum is either the best we've seen in an earlier range, or is the
    # result of adding the last element we've checked to the best range
    best_sum = [best_sum, best_with_last].max
  end

  puts best_sum
end
