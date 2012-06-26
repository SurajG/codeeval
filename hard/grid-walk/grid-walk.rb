# There is a monkey which can walk around on a planar grid. The monkey can move
# one space at a time left, right, up or down. That is, from (x, y) the monkey
# can go to (x+1, y), (x-1, y), (x, y+1), and (x, y-1). Points where the sum of
# the digits of the absolute value of the x coordinate plus the sum of the
# digits of the absolute value of the y coordinate are lesser than or equal to
# 19 are accessible to the monkey. For example, the point (59, 79) is
# inaccessible because 5 + 9 + 7 + 9 = 30, which is greater than 19. Another
# example: the point (-5, -7) is accessible because abs(-5) + abs(-7) = 5 + 7 =
# 12, which is less than 19. How many points can the monkey access if it starts
# at (0, 0), including (0, 0) itself?
#
# Print out the how many points can the monkey access. (The number should be
# printed as an integer whole number eg. if the answer is 10 (its not !!), print
# out 10, not 10.0 or 10.00 etc)

require 'set'

start = [0, 0]
$visited = Set.new [start]
$queue = [start]

def sum_digits n
  sum = 0
  n *= -1 if n < 0

  while n > 0 do
    d = n / 10
    r = n % 10
    sum += r
    n -= r
    if d > 0
      n /= 10
    end
  end

  sum
end

def accessible? x, y
  !$visited.member?([x, y]) && sum_digits(x) + sum_digits(y) <= 19
end

def explore x, y
  if accessible? x, y
    p = [x, y]
    $visited.add p
    $queue << p
  end
end

until $queue.empty?
  x, y = $queue.shift

  explore x + 1, y
  explore x - 1, y
  explore x, y + 1
  explore x, y - 1
end

puts $visited.size
