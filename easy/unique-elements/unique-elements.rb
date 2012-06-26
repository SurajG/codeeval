# You are given a sorted list of numbers with duplicates. Print out the sorted
# list with duplicates removed.

File.open(ARGV[0]).each_line do |line|
  last = nil
  uniq = line.split(',').map(&:to_i).reject do |i|
    dup = (i == last)
    last = i
    dup
  end

  puts uniq.join(',')
end
