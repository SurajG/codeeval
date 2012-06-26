# You are given two sequences. Write a program to determine the longest common
# subsequence between the two strings(each string can have a maximum length of
# 50 characters). (NOTE: This subsequence need not be contiguous. The input file
# may contain empty lines, these need to be ignored.)
#
# The first argument will be a file that contains two strings per line,
# semicolon delimited. You can assume that there is only one unique subsequence
# per test case. e.g.
#
# Input sample:
#
# XMJYAUZ;MZJAWXU
#
# Output sample:
#
# MJAU

def lcs seq1, seq2
  n, m = seq1.size, seq2.size
  table = (0..n).map { (0..m).map { 0 } }

  # Build table of LCS lengths
  for i in 1..n
    for j in 1..m
      if seq1[i - 1] == seq2[j - 1]
        # Last characters of both sequences at this point are the same
        table[i][j] = table[i - 1][j - 1] + 1
      else
        # Last characters aren't the same, so pick the longest sequence so far
        table[i][j] = [table[i - 1][j], table[i][j - 1]].max
      end
    end
  end

  # Retrieves character sequence from the table
  retrieve_seq = lambda do |i, j|
    if i == 0 or j == 0
      return ''
    elsif seq1[i - 1] == seq2[j - 1]
      return retrieve_seq.call(i - 1, j - 1) + seq1[i - 1]
    elsif table[i - 1][j] > table[i][j - 1]
      return retrieve_seq.call(i - 1, j)
    else
      return retrieve_seq.call(i, j - 1)
    end
  end
  retrieve_seq.call(n, m)
end

File.open(ARGV[0]).map(&:strip).reject{ |x| x.empty? }.each do |line|
  puts(lcs *line.split(';'))
end
