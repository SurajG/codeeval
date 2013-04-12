# You are climbing a stair case. It takes n steps to reach to the top. Each time
# you can either climb 1 or 2 steps. In how many distinct ways can you climb to
# the top?

$ways = [1, 1] # $ways[i] counts the number of ways you can climb i stairs
def count_ways(n)
  $ways << $ways[-2] + $ways[-1] while $ways.count <= n
  $ways[n]
end

File.open(ARGV[0]).map(&:to_i).each do |n|
  puts count_ways(n)
end
