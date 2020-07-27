# Any recursive algorithm can be written iteratively, and any iterative algorithm can be 
# written recursively.

# Example: Array#my_each can be written either as an iterative or a recursive method

class Array
  # each does not return the result of calling proc on elements
  def my_each(&prc)
    self.length.times { |i| prc.call(self[i]) } # i = 0, 1, 2, ...

    self
  end


  # What is the base case? Inductive step? 
  def my_each_rec(&prc)
    # base case
    return self if self.length < 1 # stop if it's an empty array

    prc.call(self.first) 

    # inductive step
    self[1..-1].my_each_rec(&prc) 
    # slicing the array is the action of reducing parameter to 
    # get to the base case
    # we are reducing length of array by one every time. eventually length becoming zero
    self 
  end
end
# Pseudo coding is not actual coding but outlining what the logic is going to be
# It's like planning what you are going to implement

arr = ["recursion", "gets", "easier", "with", "practice"]

print "Iterative: "
arr.my_each { |el| print el + " " }
puts

print "Recursive: "
arr.my_each_rec { |el| print el + " " }
puts