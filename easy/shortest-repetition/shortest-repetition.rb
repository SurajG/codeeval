# Determine the shortest repetition in a string.
#
# A string is said to have period p if it can be formed by concatenating one or
# more repetitions of another string of length p. For example, the string
# "xyzxyzxyzxyz" has period 3, since it is formed by 4 repetitions of the string
# "xyz". It also has periods 6 (two repetitions of "xyzxyz") and 12 (one
# repetition of "xyzxyzxyzxyz").

def find_period(string)
  period = 0

  while (period += 1) < string.length
    next unless string.length % period == 0

    pattern = string[0...period]
    break unless string.scan(/.{#{period}}/).any? { |chunk| chunk != pattern }
  end

  period
end

File.open(ARGV[0]).map(&:strip).each do |string|
  puts find_period(string)
end
