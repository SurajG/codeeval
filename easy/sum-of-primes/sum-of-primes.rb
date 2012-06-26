# Write a program to determine the sum of the first 1000 prime numbers.

def prime? n
  return true if n == 2
  return false if n < 2 or n % 2 == 0
  for d in (3..Math.sqrt(n).to_i).step(2) do
    return false if n % d == 0
  end
  return true
end

num_primes = 0
sum = 0
n = 2
while num_primes < 1000 do
  if prime?(n)
    num_primes += 1
    sum += n
  end
  n += 1
end

puts sum
