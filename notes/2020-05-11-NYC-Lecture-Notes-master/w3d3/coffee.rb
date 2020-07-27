require "byebug"

#Assuming each person in line wants one coffee...

def recursive_coffee(line, pos = 0)
  return 0 if line[pos] == nil
  recursive_coffee(line, pos + 1) + 1
end

# p recursive_coffee(["Carlos", "Dan", "Millie", "Mac", "Nara"])


#What if each person wants more than one coffee... 

def recursive_coffee_add(line)
  debugger
  # base case
  return line.first if line.length <= 1

  # inductive step
  last_step = recursive_coffee_add(line[1..-1]) # line[1..-1] <-> line.drop(1)
  debugger
  line.first + last_step
end
# if you are popping or shifting then you are mutating the original array
# where as slicing won't

p recursive_coffee_add([1, 2, 2, 1, 3])

