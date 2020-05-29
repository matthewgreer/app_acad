  class Stack
    def initialize
      @stack = []
    end

    def push(el)
      @stack.push(el)
    end

    def pop
      @stack.pop
    end

    def peek
      @stack.last
    end
  end

  # stack = Stack.new
  # p stack
  # stack.push("first")
  # stack.push("in last")
  # stack.push("out")
  # stack.push("in first")
  # stack.push("last")
  # p stack
  # stack.pop
  # p stack
  # stack.push(["sub", "arr"])
  # p stack
  # stack.peek
  # p stack

  class Queue

    def initialize
      @queue = []
    end

    def enqueue(el)
      @queue.unshift(el)
    end

    def dequeue
      @queue.pop
    end

    def peek
      @queue.last
    end

  end

  # queue = Queue.new
  # p queue
  # queue.enqueue("first")
  # queue.enqueue("in first")
  # queue.enqueue("out")
  # queue.enqueue("in first")
  # queue.enqueue("first")
  # p queue
  # queue.dequeue
  # p queue
  # queue.enqueue(["sub", "arr"])
  # queue.dequeue
  # queue.dequeue
  # p queue
  # queue.peek
  # p queue

  class Map

    def initialize
      @map =Array.new {Array.new}
    end

    def set(key, value)
      has, idx = self.has_key?(key)
      if has
        @map[idx][1]= value
      else
        @map.unshift([key, value])
      end
    end

    def get(key)
      has, idx = self.has_key?(key)
      if has
        return @map[idx][1]
      end
      nil
    end

    def delete(key)
      has, idx = self.has_key?(key)
      if has
        @map.delete(@map[idx])
      end
      nil
    end

    def show
      @map.last
    end

    def has_key?(key)
      @map.each.with_index do |pair, i| 
      return [true, i] if pair.first == key
      end
      [false, nil]
    end

  end

  # map = Map.new
  # p map.set("first", 3)
  # p map.set("in", 1)
  # p map.set("out", 2)
  # p map.set("not", 5)
  # p map.set("first", 9)
  # p map
  # p map.get("out")
  # p map.get("banana")
  # p map.set("in", 7)
  # p map.get("in")
  # p map.delete("out")
  # p map
  # p map.delete("app")
  # p map.show
  # p map