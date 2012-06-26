# You are to find the longest repeated substring in a given text. Repeated
# substrings may not overlap. If more than one substring is repeated with the
# same length, print the first one you find.(starting from the beginning of the
# text). NOTE: The substrings can't be all spaces.
#
# Input sample:
#
# Your program should accept as its first argument a path to a filename.The
# input file contains several lines. Each line is one test case. Each line
# contains a test string. eg.
#
# banana
#
# Output sample:
#
# For each set of input produce a single line of output which is the longest
# repeated substring. If there is none, print out the string NONE. eg.
#
# an

def longest_repeated_substring str
  longest = nil

  # Try all substrings up to half the size of the string (we can't overlap)
  (1..str.size / 2).each do |size|
    # Try all starting positions until we can only fit two substrings
    (0..str.size - 2*size).each do |offset|
      index = str.index str[offset, size], offset + size
      if index
        substr = str[index, size]
        next if substr.strip.empty? # Ignore whitespace

        longest = str[index, size]
        break # Found substring of length `size`, now move on to size+1
      end
    end
  end

  longest
end

File.open(ARGV[0]).map(&:strip).each do |word|
  puts longest_repeated_substring(word) || 'NONE'
end
