# The goal of this challenge is to design a cash register program. You will be
# given two float numbers. The first is the purchase price (PP) of the item. The
# second is the cash (CH) given by the customer. Your register currently has the
# following bills/coins within it:
#
# 'PENNY': .01,
# 'NICKEL': .05,
# 'DIME': .10,
# 'QUARTER': .25,
# 'HALF DOLLAR': .50,
# 'ONE': 1.00,
# 'TWO': 2.00,
# 'FIVE': 5.00,
# 'TEN': 10.00,
# 'TWENTY': 20.00,
# 'FIFTY': 50.00,
# 'ONE HUNDRED': 100.00
#
# The aim of the program is to calculate the change that has to be returned to
# the customer.
#
# Your program should accept as its first argument a path to a filename.The
# input file contains several lines. Each line is one test case. Each line
# contains two numbers which are separated by a semicolon. The first is the
# Purchase price (PP) and the second is the cash(CH) given by the customer. eg.
#
# 15.94;16.00
# 17;16
# 35;35
# 45;50
#
# For each set of input produce a single line of output which is the change to
# be returned to the customer. In case the CH < PP, print out ERROR. If CH ==
# PP, print out ZERO. For all other cases print the amount that needs to be
# returned, in terms of the currency values provided. The output should be
# alphabetically sorted. eg.
#
# NICKEL,PENNY
# ERROR
# ZERO
# FIVE

$denominations = [
  [ 'PENNY', 1],
  [ 'NICKEL', 5],
  [ 'DIME', 10 ],
  [ 'QUARTER', 25 ],
  [ 'HALF DOLLAR', 50 ],
  [ 'ONE', 100 ],
  [ 'TWO', 200 ],
  [ 'FIVE', 500 ],
  [ 'TEN', 1000 ],
  [ 'TWENTY', 2000 ],
  [ 'FIFTY', 5000 ],
  [ 'ONE HUNDRED', 10000 ]
].reverse

def calc_change amount_left
  return 'ERROR' if amount_left < 0
  return 'ZERO' if amount_left == 0

  change = []
  for denom, value in $denominations do
    #puts "#{denom} => #{value} => #{amount_left}"
    while value <= amount_left do
      change << denom
      amount_left -= value
    end
    break if amount_left == 0
  end

  change.sort.join(',')
end

def to_cents str
  dollars, cents = str.split('.')
  cents ||= 0
  dollars.to_i * 100 + cents.to_i
end

File.open(ARGV[0]).map { |line| line.split(';').map{ |v| to_cents(v) } }.each do |pp,ch|
  puts calc_change(ch - pp)
end
