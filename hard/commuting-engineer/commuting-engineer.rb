# Commuters in the bay area spend on average 2-3 hours of valuable time getting
# to and from work every day. That's why startups like Twitter, Yelp, Airbnb,
# and Square have called San Francisco their home.
#
# Find the shortest possible route which visits each coordinate once starting
# from point 1.
#
# Your program should accept as its first argument a path to a filename. Input
# example is the following:
#
# 1 | Home 255 King St, SF (37.7760035, -122.39317110000002)
# 2 | Twitter 1355 Market St, SF (37.776246, -122.41792229999999)
# 3 | Square 110 5th St, SF (37.7821494, -122.40589599999998)
# 4 | Yelp 706 Mission St, SF (37.7860105, -122.40253769999998)
# 5 | Airbnb 99 Rhode Island St, SF (37.7689269, -122.40290529999999)

def shortest_path_through_all(
  locations,
  distances,
  start_index,
  visited = Array.new(locations.size, false),
  num_visited = 1)

  return [0, [start_index]] if num_visited >= locations.count

  visited[start_index] = true

  best_distance = nil
  shortest_path = []

  (0...locations.count).each do |index|
    next if visited[index]

    distance, path = shortest_path_through_all(locations,
                                               distances,
                                               index,
                                               visited,
                                               num_visited + 1)
    distance += distances[start_index][index]

    if best_distance.nil? || distance <= best_distance
      best_distance = distance
      shortest_path = [start_index] + path
    end
  end

  visited[start_index] = false

  [best_distance, shortest_path]
end

locations = File.open(ARGV[0]).map do |line|
  /\((.*)\)/.match(line)[1].split(',').map(&:to_f)
end

# Precalculate distances between all locations.
distances = Array.new(locations.size) { Array.new(locations.size) }
(0...locations.size).each do |i|
  (0...locations.size).each do |j|
    distances[i][j] = Math.sqrt(
      (locations[i][0] - locations[j][0]) ** 2 +
      (locations[i][1] - locations[j][1]) ** 2)
  end
end

# Output path indices in 1-based format
puts shortest_path_through_all(locations, distances, 0)[1].map { |i| i + 1 }
