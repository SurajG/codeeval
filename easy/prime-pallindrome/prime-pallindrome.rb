# Write a program to determine the biggest prime palindrome under 1000.

def pallindrome? s
  s == s.reverse
end

limit = 1000
sieve = Array.new(limit, true)
for i in (2..limit) do
  if sieve[i]
    best = i if pallindrome?(i.to_s)
    for d in (2*i..limit).step(i) do
      sieve[d] = false
    end
  end
end

puts best
