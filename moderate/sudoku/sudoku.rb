# Sudoku is a number-based logic puzzle. It typically comprises of a 9*9 grid
# with digits so that each column, each row and each of the nine 3*3 sub-grids
# that compose the grid contains all the digits from 1 to 9. For this challenge,
# you will be given an N*N grid populated with numbers from 1 through N and you
# have to determine if it is a valid sudoku solution. You may assume that N will
# be either 4 or 9. The grid can be divided into square regions of equal size,
# where the size of a region is equal to the square root of a side of the entire
# grid. Thus for a 9*9 grid there would be 9 regions of size 3*3 each.
#
# Your program should accept as its first argument a path to a filename. Each
# line in this file contains the value of N, a semicolon and the sqaure matrix
# of integers in row major form, comma delimited.

def valid_sudoku?(rows, grid_size)
  sub_grid_size = Math.sqrt(grid_size).to_i

  # Distinct values that need to appear in each row, column, and sub-grid
  required_values = (1..grid_size).map(&:to_i)

  return false unless rows.all? { |row| row.sort == required_values }

  columns = grid_size.times.map do |i|
    rows.map { |row| row[i] }
  end

  return false unless columns.all? { |column| column.sort == required_values }

  sub_grids = grid_size.times.map do |i|
    r = i / sub_grid_size
    c = i % sub_grid_size

    rows[r * sub_grid_size, sub_grid_size].map do |row|
      row[c * sub_grid_size, sub_grid_size]
    end.flatten
  end

  sub_grids.all? { |sub_grid| sub_grid.sort == required_values }
end

File.open(ARGV[0]).each do |line|
  n, data = line.split(';')
  n = n.to_i
  data = data.split(',').map(&:to_i)

  # Extract rows in chunks of n
  rows = n.times.map do |i|
    data[i * n, n]
  end

  puts valid_sudoku?(rows, n) ? 'True' : 'False'
end
