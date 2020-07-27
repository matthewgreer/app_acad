class Stack
  def initialize
    @store = []
  end

  def push(value)
    store << value
  end

  def pop
    store.pop
  end

  def peek
    store.last
  end

  # optional methods:

  # def size
  #   store.length
  # end

  # def empty?
  #   store.empty?
  # end

  def inspect
    # we need this here so that anytime self is returned, we can show only the 
    # object id and keeep the rest of the information about our stack hidden
    # this also might be useful if you have a node that has many children that 
    # also has many children

    "#<Stack:#{self.object_id}>"
  end

# this is so that only inside of this class we have access to the @store,
# but not from pry or anywhere outside of this class
 private
 attr_reader :store
end