class MyQueue
  # in ruby there is a built in queue data type,
  # we want to create our own simple version

  def initialize
    @inner_array = []
  end

  def enqueue(el)
    inner_array.push(el)
  end

  def dequeue
    inner_array.shift
  end

  def peek
    inner_array.first
  end

  # optional methods:

  # def show
  #   inner_array.dup
  #   # why do we do this?
  #   # so that if we use this method and someone maliciously tries to alter our store,
  #   # it's really just a copy of it not the original
  # end

  # def empty?
  #   inner_array.empty?
  # end

  private
  attr_reader :inner_array
end