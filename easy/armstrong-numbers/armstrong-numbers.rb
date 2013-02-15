# An Armstrong number is an n-digit number that is equal to the sum of the n'th
# powers of its digits. Determine if the input numbers are Armstrong numbers.

def armstrong? num
  n = num.length
  num.chars.inject(0) { |sum,d| sum + (d.to_i ** n) } == num.to_i
end

File.open(ARGV[0]).each_line do |line|
  puts armstrong?(line.strip).to_s.capitalize
end
