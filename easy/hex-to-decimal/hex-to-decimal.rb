# Given a hexidecimal number, print out the decimal value

def hex_to_dec(hex)
  index = -1
  hex.upcase.chars.to_a.reverse.inject(0) do |sum,d|
    index += 1
    offset = d.ord > '9'.ord ? 'A'.ord - 10 : '0'.ord
    (d.ord - offset) * (16 ** index) + sum
  end
end

File.open(ARGV[0]).each_line do |line|
  puts hex_to_dec(line.strip)
end
