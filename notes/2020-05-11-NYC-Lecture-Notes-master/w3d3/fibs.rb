require "byebug"
# Write a method that returns the first "n" fibs numbers: 
  
  # return [] if n == 0
  # return [0] if n == 1
  # return [0, 1] if n == 2
  # return [0, 1, 1] if n == 3
  # return [0, 1, 1, 2] if n == 4
  # return [0, 1, 1, 2, 3] if n == 5
  # return [0, 1, 1, 2, 3, 5] if n == 6
  # return [0, 1, 1, 2, 3, 5, 8] if n == 7
  # return [0, 1, 1, 2, 3, 5, 8, 13] if n == 8


#Inductive step? 
# arr = n - 1
# arr[-1] + arr[-2]

#Base case? 
# if the array is empty, i.e n = 0
# if the array is [0], i.e n = 1
# if the array is [0, 1], i.e n = 2

# requirement is that we need at least two elements to figure out the next sequence

def slow_fibs(n)
  # base cases
  return [] if n == 0
  return [0] if n == 1
  return [0, 1] if n == 2

  # inductive step / recursive step
  last_int = slow_fibs(n - 1)[-1]
  second_to_last_int = slow_fibs(n - 1)[-2]

  last_num = last_int + second_to_last_int

  slow_fibs(n - 1) << last_num
end

def fibs(n)
  # base cases
  return [] if n == 0
  return [0] if n == 1
  return [0, 1] if n == 2

  # inductive step / recursive step
  # last_num = fibs(n - 1)[-1] + fibs(n - 1)[-2]
  # fibs(n - 1) << last_num

  last_fibs = fibs(n - 1)
  last_num = last_fibs[-1] + last_fibs[-2]
  last_fibs << last_num
end

# p slow_fibs(4)
p fibs(20)
p slow_fibs(20)
# p fibs(5)