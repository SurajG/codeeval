# You are given 3 coins of value 1, 3 and 5. You are also given a total which
# you have to arrive at. Find the minimum number of coins to arrive at it.

DENOMINATIONS = [5, 3, 1]

def minimum_coins_needed(amount)
  remainder = amount
  coins = 0

  DENOMINATIONS.each do |denom|
    quotient, remainder = remainder.divmod(denom)
    next if quotient == 0
    coins += quotient
  end

  coins
end

File.open(ARGV[0]).lines.map(&:to_i).map do |total|
  puts minimum_coins_needed(total)
end
