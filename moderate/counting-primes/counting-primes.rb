# Given two integers N and M, count the number of prime numbers between N and M
# (both inclusive)

def prime?(n)
  return true if n == 2
  return false if n < 2 or n % 2 == 0
  for d in (3..Math.sqrt(n).to_i).step(2) do
    return false if n % d == 0
  end
  return true
end

def primes_between(n, m)
  (n..m).inject(0) { |sum, i| sum + (prime?(i) ? 1 : 0) }
end

File.open(ARGV[0]).each_line do |line|
  n, m = line.split(',').map(&:to_i)

  puts primes_between(n, m)
end
