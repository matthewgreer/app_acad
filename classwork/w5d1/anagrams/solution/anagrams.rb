# O(n!) combinatorial time
# O(n!) combinatorial space
def first_anagram?(str1, str2)
  all_anagrams(str1).include?(str2)
end

def all_anagrams(string)
  return [string] if string.length <= 1
  prev_anagrams = all_anagrams(string[0...-1])
  new_anagrams = []

  prev_anagrams.each do |anagram|
    (0..anagram.length).each do |i|
      new_anagrams << anagram.dup.insert(i, string[-1])
    end
  end

  new_anagrams
end

# O(n^2) quadratic time
# O(n) linear space
def second_anagram?(str1, str2)
  arr1, arr2 = str1.split(''), str2.split('')

  arr1.each do |letter|
    target_idx = arr2.find_index(letter)
    return false unless target_idx
    arr2.delete_at(target_idx)
  end

  arr2.empty?
end

# O(n*log(n)) linearithmic time
# O(n) linear space
def third_anagram?(str1, str2)
  sorted_strings = [str1, str2].map do |str|
    str.split('').sort.join
  end

  sorted_strings.first == sorted_strings.last
end

# O(n) linear time
# O(1) constant space 
def fourth_anagram?(str1, str2)
  letter_counts1 = Hash.new(0)
  letter_counts2 = Hash.new(0)

  str1.each_char { |letter| letter_counts1[letter] += 1 }
  str2.each_char { |letter| letter_counts2[letter] += 1 }
  # Here, the intuitive answer to the space complexity is
  # O(n) because we're adding a separate key in the hash
  # for each character. But if the keys in the hash are single 
  # characters, then how many different keys can we have? 
  # How many different chars in the alphabet? A constant number 
  # (26 + numbers and symbols for English alphabet).

  letter_counts1 == letter_counts2
end

# O(n) linear time
# O(1) constant space (same logic as above)
def fourth_anagram_one_hash?(str1, str2)
  letter_sums = Hash.new(0)

  # If we do the exact same subractions for each letter in
  # str2 as we do additions for str1, letter_sums will all be 0.
  str1.each_char { |letter| letter_sums[letter] += 1 }
  str2.each_char { |letter| letter_sums[letter] -= 1 }

  # It's a zero-sum game!
  letter_sums.each_value.all? { |sum| sum == 0 }
end


str_1 = "gizmo"
str_2 = "sally"
str_3 = "elvis"
str_4 = "lives"
str_5 = "thousand"
str_6 = "handouts"
str_7 = "add"
str_8 = "dad"
puts "#first_anagram?"
puts "---------------"
puts
p first_anagram?(str_1, str_2)
p first_anagram?(str_3, str_4)
p first_anagram?(str_5, str_6)
p first_anagram?(str_7, str_8)
puts
puts "================="
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
puts
puts "#fourth_anagram?"
puts "---------------"
puts
p fourth_anagram?(str_1, str_2)
p fourth_anagram?(str_3, str_4)
p fourth_anagram?(str_5, str_6)
p fourth_anagram?(str_7, str_8)
puts

