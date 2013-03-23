# Given two axis aligned rectangles A and B, determine if the two overlap.
#
# Your program should accept as its first argument a path to a filename. Each
# line in this file contains 8 comma separated co-ordinates. The co-ordinates
# are upper left x of A, upper left y of A, lower right x of A, lower right y of
# A, upper left x of B, upper left y of B, lower right x of B, lower right y of
# B. e.g.
#
# -3,3,-1,1,1,-1,3,-3
# -3,3,-1,1,-2,4,2,2

# Returns whether the rectangle defined by [(x1,y2),(x2,y2)] overlaps the
# rectangle defined by [(x3,y3),(x4,y4)]
def overlapping?(x1, y1, x2, y2, x3, y3, x4, y4)
  centroid_a = [(x1 + x2) / 2, (y1 + y2) / 2]
  centroid_b = [(x3 + x4) / 2, (y3 + y4) / 2]

  # Distance from center of rectangle A to edges
  a_width = (centroid_a[0] - x1).abs
  a_height = (centroid_a[1] - y1).abs

  # Distance from center of rectange B to edges
  b_width = (centroid_b[0] - x3).abs
  b_height = (centroid_b[1] - y3).abs

  # If the distance between the centroids of A and B is less than the distance
  # between their centroids to each of their respective edges, then they must
  # overlap.
  (centroid_a[0] - centroid_b[0]).abs < a_width + b_width &&
    (centroid_a[1] - centroid_b[1]).abs < a_height + b_height
end

File.open(ARGV[0]).each do |line|
  puts overlapping?(*line.split(',').map(&:to_i)) ? 'True' : 'False'
end
