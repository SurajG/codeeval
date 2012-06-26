require 'set'
require 'thread'

words = Set.new
File.open(ARGV[0]).map(&:strip).each do |word|
  words.add word
end

start_word = 'hello'
queue = Queue.new
queue.push start_word
#queue = [start_word]
num_words = 0
visited = Set.new [start_word]
mutex = Mutex.new
resource = ConditionVariable.new
num_active = 0
num_threads = 4

num_threads.times do
  Thread.new do
    until queue.empty? do
      num_words += 1
      word = queue.pop

      mutex.synchronize do
        num_active += 1
      end

      for i in 0..word.size
        for c in 'a'..'z'
          insert = word.dup.insert(i, c)
          if words.member? insert and not visited.member? insert
            #queue << insert
            queue.push insert
            visited.add insert
          end
        end
      end

      for i in 0..word.size-1
        for c in 'a'..'z'
          next if c == word[i]
          edit = word.dup
          edit[i] = c
          if words.member? edit and not visited.member? edit
            #queue << edit
            queue.push edit
            visited.add edit
          end
        end

        delete = word.dup
        delete.slice!(i)
        if words.member? delete and not visited.member? delete
          #queue << delete
          queue.push delete
          visited.add delete
        end
      end

      mutex.synchronize do
        num_active -= 1
        resource.signal
      end
    end
  end
end

mutex.synchronize do
  resource.wait(mutex)
  until queue.empty? and num_active == 0
    resource.wait(mutex)
  end
end

puts num_words - 1 # Don't include original word in count
