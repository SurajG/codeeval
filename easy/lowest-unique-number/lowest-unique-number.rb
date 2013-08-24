# Given a list of numbers ranging from 1-9, find the index of the lowest unique
# number in the list.

MAX_VALUE = 9

def index_of_lowest_unique(numbers)
  counts = Array.new(MAX_VALUE + 1, 0)
  numbers.each { |n| counts[n] += 1 }
  lowest, index = numbers.each_with_index.select { |n, _| counts[n] == 1 }.sort.first
  index + 1 if index
end

File.open(ARGV[0]).each_line do |line|
  numbers = line.split.map(&:to_i)
  puts index_of_lowest_unique(numbers) || 0
end
