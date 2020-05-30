  class Stack               # LECTURE NOTES
    def initialize
      @stack = []            # <= confusing: don't use same name as class
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

    # def inspect             <= mine lacking these. limit amount of info this returns
    # def length                    find out how many stacks
    # def empty?                    find out if empty

    # private
    # attr_reader :stack      <= mine lacking this. important to keep user from
    #                             accessing this.

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

  class Queue                       # <= Ruby has built-in Queue class, should
                                    #       use different name

    def initialize
      @queue = []                   # <= confusing: don't use same name as class
    end

    def enqueue(el)
      @queue.push(el)
    end

    def dequeue
      @queue.shift
    end

    def peek
      @queue.first
    end


    # def inspect             <= mine lacking these. limit amount of info this returns
    # def length                    find out how many elements in queue
    # def empty?                    find out if queue empty
    # def show                      see whole queue
    # def dup                       keep user from modifying

    # private
    # attr_reader :stack      <= mine lacking this. important to keep user from
    #                             accessing this.
    

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

  # =====================
  # LECTURE NOTES

  # require_relative "queue"
  # class Node
  #   attr_reader :value :children            <= public needs access
  #   def initialize(value, children = [])
  #     @value = value
  #     @children = children
  #  end
  # end