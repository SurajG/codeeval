# Determine whether four points make a square.

def diff(a, b)
  [b[0] - a[0], b[1] - a[1]]
end

def dot(a, b)
  a[0] * b[0] + a[1] * b[1]
end

def makes_a_square?(points)
  center = points.inject([0, 0]) { |avg, point| [avg[0] + point[0], avg[1] + point[1]] }
                 .map { |coord| coord / 4.0 }

  pc = diff(points[0], center)
  distance_squared = dot(pc, pc)

  # Verify distance from each point to the center is the same. This tells us
  # that the points at least form a rectangle (possibly degenerate).
  return false if points.any? do |point|
    point_to_center = diff(point, center)
    dot(point_to_center, point_to_center) != distance_squared
  end

  # Pick an arbitrary point and compare its vector PC (i.e. the vector pointing
  # to the center of the circle) to the vectors of other points to the center).
  # If two out of three of those vectors are perpendicular to each other, then
  # we have a square.
  points[1..-1].count { |point| dot(diff(point, center), pc) == 0 } == 2
end

NUMBER = '(-?\d+)'
TUPLE = "\\(#{NUMBER},#{NUMBER}\\)"

File.open(ARGV[0]).each do |line|
  line =~ /^#{TUPLE}, #{TUPLE}, #{TUPLE}, #{TUPLE}$/
  points = [[$1, $2], [$3, $4], [$5, $6], [$7, $8]].map { |p| p.map(&:to_i) }
  puts makes_a_square?(points)
end
