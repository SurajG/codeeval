class Fixnum
  def mod(m)
    n = self
    n += m while n < 0
    n -= m while n >= m
    n
  end
end

File.open(ARGV[0]).each_line do |line|
  n, m = line.split(',').map(&:to_i)
  puts n.mod(m)
end
