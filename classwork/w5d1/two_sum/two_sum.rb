require "byebug"

def bad_two_sum?(arr, target_sum)
    subs = []
    (0...arr.length - 1).each do |i|
        (i...arr.length).each do |j|
            subs << arr[i..j]
        end
    end
    subs.any? {|el| el.sum == target_sum}
end

# time complexity O(n^2) quadratic



def okay_two_sum?(arr, target_sum)
    arr.sort
    i = 0
    j = arr.length - 1
    while i < j
        case (arr[i] + arr[j]) <=> target_sum
        when 0 
            return true
        when -1
            i += 1
        when 1
            j -= 1
        end
    end
    false
end

# time complexity O(n log n) linearithmic



def two_sum?(arr, target_sum)
    pairing = {}
    arr.each do |el|
        debugger
        return true if pairing[target_sum - el]
        pairing[el] = true
    end
    false
end

p two_sum?(arr = [0, 1, 5, 7], 6)