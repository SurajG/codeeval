# Given a 2D board and a word, find if the word exists in the grid. The word can
# be constructed from letters of sequentially adjacent cell, where adjacent
# cells are those horizontally or vertically neighboring. The same letter cell
# may not be used more than once.

require 'enumerator'

def word_exists?(word, board)
  #visited = Array.new(board.size) { Array.new(board.first.size, false) }

  (0...board.size).each do |row|
    (0...board.first.size).each do |col|
      visited = Array.new(board.size) { Array.new(board.first.size, false) }
      return true if find_word(board, visited, row, col, word)
    end
  end

  false
end

def find_word(board, visited, row, col, letters)
  return false if row < 0 || col < 0 || row >= board.size || col >= board.first.size
  return false if visited[row][col] || letters.first != board[row][col]

  visited[row][col] = true
  remaining = letters[1..-1]
  return true if remaining.empty?
  (-1..1).each do |dr|
    (-1..1).each do |dc|
      return true if find_word(board, visited, row + dr, col + dc, remaining)
    end
  end
  visited[row][col] = false
end

board = %w[
  A B C E
  S F C S
  A D E E
].each_slice(4).map { |row| row }

File.open(ARGV[0]).map(&:strip).each do |word|
  puts word_exists?(word.chars.to_a, board) ? 'True' : 'False'
end
