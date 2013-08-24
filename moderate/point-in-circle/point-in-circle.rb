# Determine whether a point is in a circle.

def distance(x1, y1, x2, y2)
  Math.sqrt((x1 - x2) ** 2 + (y1 - y2) ** 2)
end

def point_in_circle(cx, cy, radius, px, py)
  distance(cx, cy, px, py) <= radius
end

NUMBER = '(-?\d+(?:\.\d+)?)'
TUPLE = "\\(#{NUMBER}, #{NUMBER}\\)"

File.open(ARGV[0]).each do |line|
  line =~ /^Center: #{TUPLE}; Radius: #{NUMBER}; Point: #{TUPLE}$/
  puts point_in_circle(*[$1, $2, $3, $4, $5].map(&:to_f))
end
