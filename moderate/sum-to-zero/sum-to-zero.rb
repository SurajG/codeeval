# You are given an array of integers. Count the numbers of ways in which the sum
# of 4 elements in this array results in zero.

def count_ways(values)
  count = 0
  num_values = values.count
  (0...num_values).each do |i|
    ((i + 1)...num_values).each do |j|
      ((j + 1)...num_values).each do |k|
        ((k + 1)...num_values).each do |l|
          count += 1 if values[i] + values[j] + values[k] + values[l] == 0
        end
      end
    end
  end

  count
end

File.open(ARGV[0]).each_line do |line|
  values = line.split(',').map(&:to_i)
  puts count_ways(values)
end
