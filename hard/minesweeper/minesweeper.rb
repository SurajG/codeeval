# You are given an M*N matrix. Each item in this matrix is either a '*' or a
# '.'. A '*' indicates a mine whereas a '.' does not. The objective of the
# challenge is to output a M*N matrix where each element contains a number
# (except the positions which actually contain a mine which will remain as '*')
# which indicates the number of mines adjacent to it.

require 'enumerator'

def count_mines(matrix, row, col)
  count = 0
  (-1..1).each do |dr|
    (-1..1).each do |dc|
      r = row + dr
      c = col + dc
      next if r < 0 || r >= matrix.size || c < 0 || c >= matrix.first.size
      count += 1 if matrix[r][c] == '*'
    end
  end
  count
end

def find_mines(matrix)
  (0...matrix.size).each do |row|
    (0...matrix.first.size).each do |col|
      matrix[row][col] = count_mines(matrix, row, col) unless matrix[row][col] == '*'
    end
  end
  matrix
end

File.open(ARGV[0]).each do |line|
  dimensions, data = line.strip.split(';')
  rows, cols = dimensions.split(',').map(&:to_i)
  matrix = data.chars.to_a.each_slice(cols).map { |row| row }
  puts find_mines(matrix).map(&:join).join
end
