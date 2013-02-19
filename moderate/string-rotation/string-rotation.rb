# You are given two strings. Determine if the second string is a rotation of the
# first string.

def rotation?(a, b)
  return false if a.length != b.length
  return true if a == b

  first_char = a[0]

  # For each place in the second string where the starting character of the
  # first string appears, check if the two substrings represented by this
  # dividing point match up.
  # (e.g. for hello and llohe, compare 0..1 of first string with 3..4 of second
  # string, and, 2..4 of first string with 0..2 of second string)
  start = -1
  while start = b.index(first_char, start + 1)
    next if a[0...-start] != b[start..-1]
    return true if a[(a.length - start)..-1] == b[0...start]
  end

  false
end

File.open(ARGV[0]).each_line do |line|
  a, b = line.split(',').map(&:strip)
  puts rotation?(a, b).to_s.capitalize
end
