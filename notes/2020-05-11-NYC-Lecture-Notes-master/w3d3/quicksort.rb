# What is monkey patching?
# - extending a class

# What is quick sort? 
# 

# Base case? 
# array.length == 1 or empty array, which means no sorting is necessary
# Inductive step?
# quicksort on left and right arrays

class Array

    def quicksort # [1, 2, 3] | [2, 3]
      # base cases
      # return [] if self.length == 0
      # return self if self.length == 1
      return self if self.length == 0 || self.length == 1

      # inductive case
      pivot = self.first # 1 | 2
      left_arr = self.select { |el| el < pivot } # [1, 2, 3] | [] | []
      right_arr = self.drop(1).select { |el| el >= pivot } # [2, 3] | [3]

      left_arr.quicksort + [pivot] + right_arr.quicksort # [] + [1] + [2, 3] = [1, 2, 3]
    end 

end 

p [4, 6, 2, 1, 7].quicksort
p [10, 8, 3, 5 ,9].quicksort