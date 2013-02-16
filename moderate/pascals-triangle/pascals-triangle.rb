# Print out pascals triangle to a certain depth.

def get(arr, level, index)
  return 0 if index < 0 || index >= level
  offset = (level * (level + 1) / 2) - level
  arr[offset + index] || 0
end

def set(arr, level, index, val)
  offset = (level * (level + 1) / 2) - level
  arr[offset + index] = val
end

def print_triangle(depth)
  # Since the total number of elements is monotonically increasing with each
  # level, we can use the series sum 1..n = n(n+1)/2.
  triangle = Array.new(depth * (depth + 1) / 2)
  triangle[0] = 1

  for l in 2..depth
    for i in 0...l
      set(triangle, l, i, get(triangle, l - 1, i - 1) + get(triangle, l - 1, i))
    end
  end

  triangle
end

File.open(ARGV[0]).each_line do |line|
  puts print_triangle(line.to_i).join(' ')
end
