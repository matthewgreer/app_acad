class Array
  def merge_sort(&prc)
    return self if self.count <= 1 # [3] or [] are trivially sorted

    prc ||= Proc.new { |a, b| a <=> b } # define default proc if no block given
  
    middle = self.length / 2
    left = self[0...middle]
    right = self[middle..-1]
  
    sorted_left = left.merge_sort(&prc) # make sure to pass the block on!
    sorted_right = right.merge_sort(&prc)
    Array.merge(sorted_left, sorted_right, prc)
  end
  
  private # this method can only be called from within this class

  def self.merge(left, right, prc) # this is a class method, it must be called with the Array class as the receiver

    result = []
    until left.empty? || right.empty?
      if prc.call(left[0], right[0]) <= 0
        result += [left.shift] # concatenation requires both operands to be arrays
      else
        result << right.shift # this also works!
      end
    end
  
    result + left + right
  end
end


array = [5, 4, 300, 25, 21, 26, 24]

p array.merge_sort
# p array.merge_sort { |a, b| a * b }

# p array.merge_sort { |a, b| b <=> a }