# Flavius Josephus was a famous Jewish historian of the first century, at the
# time of the destruction of the Second Temple. According to legend, during the
# Jewish-Roman war he was trapped in a cave with a group of soldiers surrounded
# by Romans. Preferring death to capture, the Jews decided to form a circle and,
# proceeding around it, to kill every j'th person remaining until no one was
# left. Josephus found the safe spot in the circle and thus stayed alive. Write
# a program that returns a list of n people, numbered from 0 to n - 1, in the
# order in which they are executed.
#
# Your program should accept as its first argument a path to a filename. Each
# line in this file contains two comma separated positive integers n and m,
# where n is the number of people and every m'th person will be executed.

def kill_sequence(n, m)
  people = Array.new(n, true) # true = alive
  sequence = []
  index = -1

  while sequence.length < n
    # Advance through list until we've landed on the mth alive person
    count = 0
    while count < m
      index = (index + 1) % n
      count += 1 if people[index]
    end

    # Kill them
    people[index] = false
    sequence << index
  end

  sequence
end

File.open(ARGV[0]).each do |line|
  n, m = line.split(',').map(&:to_i)
  puts kill_sequence(n, m).join(' ')
end
