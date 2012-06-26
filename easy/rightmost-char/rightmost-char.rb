# You are given a string 'S' and a character 't'. Print out the position of the
# rightmost occurrence of 't'(case matters) in 'S' or -1 if there is none. The
# position to be printed out is zero based.

File.open(ARGV[0]).each_line do |line|
  unless line.empty?
    s, t = line.strip.split(',')
    puts (s.rindex(t) || -1)
  end
end
