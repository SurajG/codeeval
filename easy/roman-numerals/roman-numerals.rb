# Many persons are familiar with the Roman numerals for relatively small
# numbers. The symbols I (capital i), V, X, L, C, D, and M represent the decimal
# values 1, 5, 10, 50, 100, 500 and 1000 respectively. To represent other
# values, these symbols, and multiples where necessary, are concatenated, with
# the smaller-valued symbols written further to the right. For example, the
# number 3 is represented as III, and the value 73 is represented as LXXIII. The
# exceptions to this rule occur for numbers having units values of 4 or 9, and
# for tens values of 40 or 90. For these cases, the Roman numeral
# representations are IV (4), IX (9), XL (40), and XC (90). So the Roman numeral
# representations for 24, 39, 44, 49, and 94 are XXIV, XXXIX, XLIV, XLIX, and
# XCIV, respectively.

SYMBOLS = %w[I X C M]
HALF_SYMBOLS = %w[V L D]

def roman_numeral(number)
  numeral = ''

  digits = number.length

  number.chars.map(&:to_i).each_with_index do |digit, index|
    next if digit == 0

    order = digits - index

    if digit == 4
      numeral += SYMBOLS[order - 1] + HALF_SYMBOLS[order - 1]
    elsif digit == 9
      numeral += SYMBOLS[order - 1] + SYMBOLS[order]
    elsif digit == 5
      numeral += HALF_SYMBOLS[order - 1]
    elsif digit > 5
      numeral += HALF_SYMBOLS[order - 1] + SYMBOLS[order - 1] * (digit - 5)
    else
      numeral += SYMBOLS[order - 1] * digit
    end
  end

  numeral
end

File.open(ARGV[0]).map(&:strip).each do |number|
  puts roman_numeral(number)
end
