# You are writing out a list of numbers.Your list contains all numbers with
# exactly Di digits in its decimal representation which are equal to i, for each
# i between 1 and 9, inclusive. You are writing them out in ascending order. For
# example, you might be writing every number with two '1's and one '5'. Your
# list would begin 115, 151, 511, 1015, 1051. Given N, the last number you
# wrote, compute what the next number in the list will be. The number of 1s, 2s,
# ..., 9s is fixed but the number of 0s is arbitrary.
#
# Your program should accept as its first argument a path to a filename. Each
# line in this file is one test case. Each test case will contain an integer
# n < 10^6.
#
# For each line of input, generate a line of output which is the next integer in
# the list.

def next_perm a
  len = a.size
  return a if len < 2
  i = len - 1

  # Decrease i until we find the first item that is lexicographically less
  # than item after it (or we hit the beginning of the list, in which case all
  # items are in descending lexicographic order).
  # All items at index `tail` onward are thus in lexicographically descending
  # order, which we'll call the tail.  We'll call all items from index 0 to
  # `tail - 1` the head.
  until i == 0
    tail = i
    i -= 1

    if a[i] < a[tail]
      # Find the smallest element in the tail that is lexicographically greater
      # than the final element in the head, a[i], and swap them. This will
      # create the lexicographical successor of head.
      j = len
      nil until a[i] < a[j -= 1]
      a[i], a[j] = a[j], a[i]

      # Reverse the 'tail' of the list so that it is now lexicographic minimum
      start, stop = tail, len - 1
      while start < stop do
        a[start], a[stop] = a[stop], a[start]
        start += 1; stop -= 1
      end

      # With the tail reversed, and head being the lexicographic successor, we
      # now have the overall lexicographic successor for the entire list
      return a
    end
  end

  # We're at the maximum lexicographic permutation (i.e. items are in descending
  # order); reverse the list to bring us back to lexicographic minimum
  a.reverse
end

def next_value n
  digits = n.to_s

  # If we've reached the last lexicographic ordering of digits, reverse them and
  # shift the leading zeros past the first non-zero digit, and insert another
  # zero after those zeros.
  # e.g. 5110 becomes 0115 reversed, so we shift the leading zeros past the
  # first non-zero digit (1) and insert another zero getting 10015, which is the
  # next lowest number.
  if digits.chars.to_a.sort.reverse.join('') == digits
    num_zeros = digits.reverse.chars.to_a.index{ |d| d != '0' }
    without_zeros = digits.reverse[num_zeros, digits.size - num_zeros]
    zeros = '0' * (num_zeros + 1)
    return without_zeros[0] + zeros + without_zeros[1, without_zeros.size - 1]
  end

  # Otherwise, just get the next lexicographic ordering
  next_perm(digits.chars.to_a).join('').to_i
end


File.open(ARGV[0]).map(&:to_i).each do |n|
  puts next_value(n)
end
