require 'byebug'

# # Blocks

class Array
  def my_each_with_block(&prc)
    debugger  # When we inspect `prc` in byebug, will it be a block or a proc?
    i = 0

    while i < self.length
      prc.call(self[i])
    
      i += 1
    end

    self
  end
end

# arr = [1,2,3]
# arr.my_each_with_block { |el| p el }


# ["j", "b"].map(&:upcase)















#################################################################


## Blocks vs Procs

class Array
  # this method is expecting to receive a block
  def my_each_with_block(&prc)
    # debugger
    i = 0

    while i < self.length
      prc.call(self[i])
    
      i += 1
    end

    self
  end

  # this method is expecting to receive a proc
  def my_each_with_proc(prc) # if we pass in block, this will throw an error
    # debugger
    i = 0

    while i < self.length
      prc.call(self[i])
    
      i += 1
    end

    self
  end
end

arr = [1,2,3]
# arr.my_each_with_block { |el| p el }

# What happens when we try to invoke `my_each_with_proc` with a block?
# arr.my_each_with_proc { |el| p el } # Predict: What will we see in the terminal? --> this throws an error



prc = Proc.new { |el| p el }
arr.my_each_with_proc(prc)



# How can we leverage the `my_each_with_block` method to make `my_each_with_proc` one line?
  # see below










#################################################################


## Using `&` to convert between blocks and procs

class Array

  # here, when we *define* a method and use `&prc` to define a parameter, we turn a block into a proc
  def my_each_with_block(&prc)  # block --> proc
    debugger
    i = 0

    while i < self.length
      prc.call(self[i])
    
      i += 1
    end

    self
  end

  def my_each_with_proc(prc=nil)
    debugger

    # here, when we *invoke* the method with `&prc` as an argument, we turn the proc into a block
    my_each_with_block(&prc)  # proc --> block
  end
end

# arr = [1,2,3]

# prc = Proc.new { |el| p el }
# arr.my_each_with_proc(prc)











################################################################


## Blocks with `yield` keyword

class Array
  # # VERSION 1: using `prc.call` (preferred)
  def my_each_with_block(&prc)  # the first line tells us right away that this method takes a block
    debugger
    i = 0

    while i < self.length
      prc.call(self[i])
    
      i += 1
    end

    self
  end


  # # VERSION 2: using `yield`
  def my_each_with_block  # in this version, we have to skim through the method and notice the `yield` keyword in order to know that this method needs to be invoked with a block
    # debugger
    i = 0

    while i < self.length
      yield(self[i])   # yields control to any block that was passed in (executes code inside of the block)
    
      i += 1
    end

    self
  end
end

arr = [1,2,3]
print arr.my_each_with_block { |el| p el }