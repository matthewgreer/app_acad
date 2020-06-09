require "byebug"


# Phase I First, write a function that compares each element to every other
# element of the list. Return the element if all other elements in the array
# are larger. What is the time complexity for this function?

def terrible_my_min(array)
    smallest = array[0]
    array.each do |el1|
       smallest = el1 if array.all? {|el2| el2 >= el1}
    end
    smallest
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

puts "#my_min SOLUTIONS"
puts "================="
puts
puts "terrible my_min"
p terrible_my_min(list)
puts
puts "============"

# #terrible_my_min has O(n^2) or quadratic time complextity, as it iterates
# through each element of the array once for each element of the array 
# (nested loop).

def better_my_min(array)
    array.inject {|smallest, ele| ele > smallest ? smallest : ele}
end 

puts
puts "better my_min"
p better_my_min(list)
puts

puts "================================="
puts "================================="
puts

# The time complexity of #better_my_min is O(n) or linear, since finding the smallest
# element requires one iteration through the entire array.

# ===================

# You have an array of integers and you want to find the largest contiguous
# (together in sequence) sub-sum. Find the sums of all contiguous sub-arrays
# and return the max.

#  Write a function that iterates through the array and finds all sub-arrays
# using nested loops. First make an array to hold all sub-arrays. Then find
# the sums of each sub-array and return the max.

#  Discuss the time complexity of this solution.

def horrible_largest_contiguous_subsum(array)
    subsets = []
    (0...array.length).each do |i1| # <= n
        (i1...array.length).each {|i2| subsets << array[i1..i2]} # <= n
    end
    # debugger
    sums = subsets.map {|sub| sub.sum} # <= n! number of subsets = array.length!
    sums.max
end

arr_1 = [5, 3, -7]
arr_2 = [2, 3, -6, 7, -6, 7]
arr_3 = [-5, -1, -3]

puts "#largest_contiguous_subsum SOLUTIONS"
puts "===================================="
puts
puts "horrible largest_contiguous_subsum"

p horrible_largest_contiguous_subsum(arr_1)
p horrible_largest_contiguous_subsum(arr_2)
p horrible_largest_contiguous_subsum(arr_3)

# The time complexity of #horrible_largest_contiguous_array is factorial or
# O(n!), as the number of subsets generated will be array.length * 
# array.length - 1. The two previous nested iterations through the length
# of the array (n^2) are dropped, due to the dominance of O(n!).

def better_largest_contiguous_subsum(array)
    max_sum = array[0]     # <= creating variables, but not a new array
    current_sum = array[0] # <= doesn't significantly change the
                           # <= space complexity from O(1) to O(n)

    return array.max if array.all? {|el| el < 0} # <= to account for an
                # edge case where the array contains only negative numbers

    (1...array.length).each do |i|
        # debugger
        current_sum += array[i] 
        current_sum = 0 if current_sum < 0 # <= reset to current element
                               # if the prior sum would subtract from it
        max_sum = current_sum if current_sum > max_sum  #<= if
    end
    max_sum
end

puts
puts "============"
puts
puts "better largest_contiguous_subsum"

p better_largest_contiguous_subsum(arr_1)
p better_largest_contiguous_subsum(arr_2)
p better_largest_contiguous_subsum(arr_3)

# Because this really stumped me, I looked up some information on it. Apparently
# this is called Kadane's Algorithm, and it's kind of a dynamic programming
# paragon.

# I watched about 3 videos and read about 5 explanations. I still have trouble
# understanding it, but I see that it works. It allows the largest subsum to be
# found in O(n) time complexity, and O(1) space complexity. Cool.
