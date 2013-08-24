# Calculate the distance between two points.

def distance(x1, y1, x2, y2)
  Math.sqrt((x1 - x2) ** 2 + (y1 - y2) ** 2).to_i
end

NUMBER = '(-?\d+)'
TUPLE = "\\(#{NUMBER}, #{NUMBER}\\)"
File.open(ARGV[0]).each_line do |line|
  line =~ /#{TUPLE} #{TUPLE}/
  puts distance(*[$1, $2, $3, $4].map(&:to_i))
end
