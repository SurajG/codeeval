# Simple insertion sort
def sort(list)
  for i in 1...list.length
    j = i
    while j > 0 && list[j - 1] > list[j]
      list[j - 1], list[j] = list[j], list[j - 1]
      j -= 1
    end
  end

  list
end

File.open(ARGV[0]).each_line do |line|
  numbers = line.split(' ').map(&:to_f)
  puts sort(numbers).map { |n| '%0.3f' % n  }.join(' ')
end
