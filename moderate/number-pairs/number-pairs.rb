# You are given a sorted array of positive integers and a number 'X'. Print out
# all pairs of numbers whose sum is equal to X. Print out only unique pairs and
# the pairs should be in ascending order
# Input sample:
#
# Your program should accept as its first argument a filename. This file will
# contain a comma separated list of sorted numbers and then the sum 'X',
# separated by semicolon. Ignore all empty lines. If no pair exists, print the
# string NULL e.g.
#
# 1,2,3,4,6;5
# 2,4,5,6,9,11,15;20
# 1,2,3,4;50
#
# Print out the pairs of numbers that equal to the sum X. The pairs should
# themselves be printed in sorted order i.e the first number of each pair should
# be in ascending order e.g.
#
# 1,4;2,3
# 5,15;9,11
# NULL

def exists? item, list, lo, hi
  until lo >= hi
    mid = ((lo + hi) / 2).to_i
    if list[mid] < item
      lo = mid + 1
    elsif list[mid] > item
      hi = mid - 1
    else
      return true
    end
  end
  list[lo] == item
end

File.open(ARGV[0]).each_line.reject{ |x| x.strip.empty? }.each do |line|
  nums, sum = line.split(';')
  nums = nums.split(',').map(&:to_i)
  sum = sum.to_i

  pairs = []
  i = 0
  while i < nums.size and 2 * nums[i] <= sum
    n = nums[i]
    pairs << [n, sum - n] if exists?(sum - n, nums, i + 1, nums.size - 1)
    i += 1
  end

  puts (pairs.empty? ? 'NULL' : pairs.map{ |x| x.join(',') }.join(';'))
end
