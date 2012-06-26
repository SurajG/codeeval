File.open(ARGV[0]).each_line do |line|
  x, n = line.split(',').map(&:to_i)

  smallest = n
  while smallest < x do
    multiple = 1
    multiple *= 2 while smallest + n * multiple * 2 < x
    smallest += n * multiple
  end

  puts smallest
end
