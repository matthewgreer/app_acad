fish = [

    'fish', 
    'fiiish', 
    'fiiiiish', 
    'fiiiish', 
    'fffish', 
    'ffiiiiisshh', 
    'fsh', 
    'fiiiissshhhhhh'

]



def sluggish_octopus(fish)
    fished = false
    while !fished
        fished = true
        (0...fish.length-1).each do |i|
            (i+1...fish.length).each do |j|
                if fish[i].length > fish[j].length
                    fish[i], fish[j] = fish[j], fish[i]
                    fished = false
                end
            end
        end
    end
    fish.last
end


def dominant_octopus(fish)
    return fish if fish.length == 1
    mid = fish.length / 2
    left = dominant_octopus(fish.take(mid))
    right = dominant_octopus(fish.drop(mid))
    use_eight_arms(left, right)
end


def use_eight_arms(left, right)
    fished = []
    until left.empty? || right.empty?
        fished << (left.first.length <= right.first.length ? left.shift : right.shift)
    end
    fished + left + right
end


def clever_octopus(fish)
    fish.inject {|biggest, fish| fish.length > biggest.length ? fish : biggest}
end


# p sluggish_octopus(fish)
# p dominant_octopus(fish).last
# p clever_octopus(fish)

tiles_array = [

    "up", 
    "right-up", 
    "right", 
    "right-down", 
    "down", 
    "left-down", 
    "left", 
    "left-up" 

]

def octopus_slow_dance(dir, tiles)
    tiles.each.with_index do |tile, i|
        return i if dir == tile
    end
    nil
end
    

p octopus_slow_dance("up", tiles_array)
p octopus_slow_dance("right-down", tiles_array)


tiles_hash = {

    "up" => 0, 
    "right-up" => 1, 
    "right" => 2, 
    "right-down" => 3, 
    "down" => 4, 
    "left-down" => 5, 
    "left" => 6, 
    "left-up" => 7 

}



def octopus_fast_dance(dir, tiles_hash)
    tiles_hash[dir]
end


p octopus_fast_dance("up", tiles_hash)
p octopus_fast_dance("right-down", tiles_hash)