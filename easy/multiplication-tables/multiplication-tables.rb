# Print out the grade school multiplication table upto 12*12.

rows = 12
cols = 12

(1..rows).each do |r|
  print r
  (2..cols).each do |c|
    printf(STDOUT, '%4d', r * c)
  end
  print "\n"
end
