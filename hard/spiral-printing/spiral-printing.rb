# Write a program to print a 2D array (n x m) in spiral order (clockwise)
#
# Your program should accept as its first argument a path to a filename.The
# input file contains several lines. Each line is one test case. Each line
# contains three items (semicolon delimited). The first is 'n'(rows), the second
# is 'm'(columns) and the third is a single space separated list of
# characters/numbers in row major order. eg.
#
# Input sample:
#
# 3;3;1 2 3 4 5 6 7 8 9
#
# Output sample:
#
# Print out the matrix in clockwise fashion, one per line, space delimited. eg.
#
# 1 2 3 6 9 8 7 4 5

def spiral_print matrix, rows, cols
  sx, sy = 0, 0
  ex, ey = cols-1, rows-1
  values = []

  until sx > ex or sy > ey do
    for c in sx..ex     do values << matrix[sy][c]    end
    for r in sy+1..ey   do values << matrix[r][ex]    end
    for c in 1..ex-sx   do values << matrix[ey][ex-c] end if sy != ey
    for r in 1..ey-sy-1 do values << matrix[ey-r][sx] end if sx != ex

    sx += 1
    sy += 1
    ex -= 1
    ey -= 1
  end

  values
end

File.open(ARGV[0]).each do |line|
  data = line.split ';'
  rows = data[0].to_i
  cols = data[1].to_i
  values = data[2].split ' '
  matrix = (0..rows-1).map do |i|
    values[i*cols, cols]
  end

  puts spiral_print(matrix, rows, cols).join(' ')
end
