# A positive integer is a palindrome if its decimal representation (without
# leading zeros) is a palindromic string (a string that reads the same forwards
# and backwards). For example, the numbers 5, 77, 363, 4884, 11111, 12121 and
# 349943 are palindromes.
#
# A range of integers is interesting if it contains an even number of
# palindromes. The range [L, R], with L <= R, is defined as the sequence of
# integers from L to R (inclusive): (L, L+1, L+2, ..., R-1, R). L and R are the
# range's first and last numbers.
#
# The range [L1,R1] is a subrange of [L,R] if L <= L1 <= R1 <= R. Your job is to
# determine how many interesting subranges of [L,R] there are.
# Input sample:
#
# Your program should accept as its first argument a path to a filename. Each
# line in this file is one test case. Each test case will contain two positive
# integers, L and R (in that order), separated by a space. e.g.
#
# 1 2
# 1 7
# 87 88
#
# Output sample:
#
# For each line of input, print out the number of interesting subranges of [L,R]
# e.g.
#
# 1
# 12
# 1
#
# For the curious: In the third example, the subranges are: [87](0 palindromes),
# [87,88](1 palindrome),[88](1 palindrome). Hence the number of interesting
# palindromic ranges is 1

def pallindrome? n
  s = n.to_s
  for i in 0..(s.size/2).floor-1
    return false if s[i] != s[-i-1]
  end
  true
end

def ranges pallindromes, l, r
  return [] if l > r

  if pallindromes.empty?
    # Return all possible pairs representing all possible subranges
    individual = (l..r).to_a
    return individual.combination(2).to_a.map(&:sort) +
           individual.map { |x| [x, x] }
  end

  ranges = []
  if pallindromes.size == 1
    ranges += ranges([], l, pallindromes.first - 1)
    ranges += ranges([], pallindromes.first + 1, r)
  else
    if pallindromes.size.even?
      # Include all possible ranges that cover the range of pallindromes
      for i in l..(pallindromes.first)
        for j in (pallindromes.last)..r
          ranges << [i, j]
        end
      end
    end

    left = ranges(pallindromes[0..-2], l, pallindromes[-2])
    right = ranges(pallindromes[1..-1], pallindromes[1], r)

    ranges += (left + right).uniq
  end

  ranges
end

File.open(ARGV[0]).each do |line|
  l,r = line.split(' ').map(&:to_i)

  pallindromes = (l..r).reject do |n|
    not pallindrome? n
  end

  puts ranges(pallindromes, l, r).size
end
