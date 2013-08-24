# Determine if a number is even.

File.open(ARGV[0]).map(&:to_i).each do |number|
  puts number % 2 == 0 ? 1 : 0
end
