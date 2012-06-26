def dist p1, p2
  Math.sqrt((p1[0]- p2[0])**2 + (p1[1] - p2[1])**2)
end

def min_distance points
  min = Float::MAX
  for i in 0..points.size-2
    for j in (i+1)..(points.size-1)
      min = [min, dist(points[i], points[j])].min
    end
  end
  min
end

File.open(ARGV[0]) do |f|
  num_points = f.readline.to_i
  while num_points > 0
    points = num_points.times.map do
      f.readline.split(' ').map(&:to_f)
    end
    d = min_distance points
    puts (d < 10000 ? "%.4f" % d : 'INFINITY')

    num_points = f.readline.to_i
  end
end
