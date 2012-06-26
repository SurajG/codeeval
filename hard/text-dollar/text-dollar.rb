# Print out a textual representation of a dollar amount

def number_to_text n
  if n < 20
    %w[Zero One Two Three Four Five Six Seven Eight Nine Ten Eleven Twelve
       Thirteen Fourteen Fifteen Sixteen Seventeen Eighteen Nineteen][n]
  elsif n < 100
    %w[Twenty Thirty Forty Fifty Sixty Seventy Eighty Ninety][(n/10).floor-2] +
      (n % 10 > 0 ? number_to_text(n % 10) : '')
  elsif n < 1000
    number_to_text((n/100).floor) + 'Hundred' +
      (n % 100 > 0 ? number_to_text(n % 100) : '')
  else
    magnitude = Math.log10(n).floor
    number_to_text(n.to_s[0, magnitude % 3 + 1].to_i) +
      %w[Thousand Million Billion][(magnitude/3).floor - 1] +
      (n % 10**magnitude > 0 ?
        number_to_text(n.to_s[magnitude % 3 + 1..-1].to_i) : '')
  end
end

File.open(ARGV[0]).map(&:to_i).each do |number|
  puts number_to_text(number) + 'Dollars'
end
