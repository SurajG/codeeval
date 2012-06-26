# Print out the prime numbers less than a given number N. For bonus points your
# solution should run in N*(log(N)) time or better. You may assume that N is
# always a positive integer.

vals = File.open(ARGV[0]).readlines.map(&:to_i)
largest = vals.max

sieve = Array.new(largest, true)
for i in (2..largest) do
  if sieve[i]
    for d in (2*i..largest).step(i) do
      sieve[d] = false
    end
  end
end

vals.each do |v|
  print 2 if v > 2
  for i in (3..v-1).step(2) do
    print ',%d' % i if sieve[i]
  end
  print "\n"
end
