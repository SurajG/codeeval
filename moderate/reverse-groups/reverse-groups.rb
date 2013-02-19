# Given a list of numbers and a positive integer k, reverse the elements of the
# list, k items at a time. If the number of elements is not a multiple of k,
# then the remaining items in the end should be left as is.

class Array
  def reverse_in_groups_of(group_size)
    (0...(group_size * (self.size / group_size))).step(group_size) do |i|
      (0..(group_size - 1)/2).each do |j|
        a, b = i + j, i + group_size - j - 1
        self[a], self[b] = self[b], self[a]
      end
    end
    self
  end
end

File.open(ARGV[0]).each_line do |line|
  list, group_size = line.split(';')
  group_size = group_size.to_i

  list = list.split(',').map(&:to_i)
  puts list.reverse_in_groups_of(group_size).join(',')
end
