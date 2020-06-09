# Phase I:
# Write a method #first_anagram? that will generate and store all
# the possible anagrams of the first string. Check if the second
# string is one of these.

# What is the time complexity of this solution? Factorial O(n!)
# What happens if you increase the size of the strings? I grow a white beard
# waiting for the algorithm to finish.

str_1 = "gizmo"
str_2 = "sally"
str_3 = "elvis"
str_4 = "lives"
str_5 = "thousand"
str_6 = "handouts"
str_7 = "add"
str_8 = "dad"
 
def first_anagram?(str_1, str_2)
    arr = str_1.split("")
    letter_rearrange = arr.permutation.to_a
    anagrams = letter_rearrange.map(&:join)
    anagrams.include?(str_2)
end

puts "#first_anagram?"
puts "---------------"
puts
p first_anagram?(str_1, str_2)
p first_anagram?(str_3, str_4)
p first_anagram?(str_5, str_6)
p first_anagram?(str_7, str_8)
puts
puts "================="

# Phase II:
# Write a method #second_anagram? that iterates over the first string. For
# each letter in the first string, find the index of that letter in the second
# string (hint: use Array#find_index) and delete at that index. The two strings
# are anagrams if an index is found for every letter and the second string is
# empty at the end of the iteration. Try varying the length of the input
# strings.

# What are the differences between #first_anagram? and
# #second_anagram??

# Second is faster and uses less space -- quadratic 0(n^2) time & 0(n) space

def second_anagram?(str_1, str_2)
    arr = str_2.split("")     
    str_1.each_char do |char|     
        i = arr.find_index(char)
        return false if i.nil?
        arr.delete_at(i)
    end
    arr.empty?
end

puts
puts "#second_anagram?"
puts "---------------"
puts
p second_anagram?(str_1, str_2)
p second_anagram?(str_3, str_4)
p second_anagram?(str_5, str_6)
p second_anagram?(str_7, str_8)
puts
puts "================="


# Phase III:
# Write a method #third_anagram? that solves the problem by sorting both
# strings alphabetically. The strings are then anagrams if and only if the
# sorted versions are the identical.

# What is the time complexity of this solution? Linearithmic O(n log n)
# Is it better or worse than #second_anagram?? Better, but not much. O(n) space

def third_anagram?(str_1, str_2)
    str_1.split("").sort == str_2.split("").sort 
end

puts
puts "#third_anagram?"
puts "---------------"
puts
p third_anagram?(str_1, str_2)
p third_anagram?(str_3, str_4)
p third_anagram?(str_5, str_6)
p third_anagram?(str_7, str_8)
puts
puts "================="


# Phase IV:
# Write one more method #fourth_anagram?. This time, use two Hashes to store
# the number of times each letter appears in both words. Compare the 
# resulting hashes.

# What is the time complexity?

# Bonus: Do it with only one hash.


def fourth_anagram?(str_1, str_2)
    return false if str_1.length != str_2.length
    hash = Hash.new(0)
    str_1.each_char {|char| hash[char] += 1}
    # str_2.each_char do |char|
    #     return false if !hash.has_key?(char)
    #     hash[char] == 1 ? hash.delete(char) : hash[char] -= 1
    # end
    # hash.empty?
    str_2.each_char {|char| hash[char] -= 1}
    hash.values.all? {|el| el == 0}
end

puts
puts "#fourth_anagram?"
puts "---------------"
puts
p fourth_anagram?(str_1, str_2)
p fourth_anagram?(str_3, str_4)
p fourth_anagram?(str_5, str_6)
p fourth_anagram?(str_7, str_8)
puts
