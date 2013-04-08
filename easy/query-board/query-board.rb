$size = 256
$board = Array.new($size) { Array.new($size, 0) }

def parse_command(args)
  case args.first
  when 'SetCol'
    col = args[1].to_i
    val = args[2].to_i
    (0...$size).each do |i|
      $board[i][col] = val
    end
  when 'SetRow'
    row = args[1].to_i
    val = args[2].to_i
    (0...$size).each do |i|
      $board[row][i] = val
    end
  when 'QueryCol'
    col = args[1].to_i
    puts (0...$size).inject(0) { |sum, i| sum + $board[i][col] }
  when 'QueryRow'
    row = args[1].to_i
    puts (0...$size).inject(0) { |sum, i| sum + $board[row][i] }
  end
end

File.open(ARGV[0]).each do |line|
  args = line.split(' ')
  parse_command(args)
end
