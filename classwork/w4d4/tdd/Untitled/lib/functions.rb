class Array
  def my_uniq
    arr = []
    self.each { |ele| arr << ele if !arr.include?(ele) }
    arr
  end

  def to_sum
    arr = []
    for i in 0...size
      for j in (i + 1)...size
        arr << [i, j] if self[i] + self[j] == 0
      end
    end
    arr
  end
end

def my_transpose(matrix)
  (0...matrix.length).map do |i|
    matrix.map { |array| array[i] }
  end
end

def stock_picker(stock_prices)
  raise ArgumentError if stock_prices.class != Array
  maximum = 0
  indices_of_maximum = []
  for i in 0...stock_prices.length
    for j in (i + 1)...stock_prices.length
      diff = stock_prices[j] - stock_prices[i]
      if diff > maximum
        maximum = diff
        indices_of_maximum = [i, j]
      end
    end
  end
  indices_of_maximum
end

class TowersOfHanoi
  attr_reader :pieces, :left, :middle, :right

  def initialize(num_pieces)
    @pieces = num_pieces
    @left = (1..@pieces).to_a
    @middle = []
    @right = []
  end

  def run
    p @left
    p @middle
    p @right
    while !self.won?
      #   prompt = gets.chomp.split(",")
      prompt = ["left", "right"]
      start_tower = choose_tower(prompt[0])
      end_tower = choose_tower(prompt[1])
      p self.move(start_tower, end_tower)

      break
    end
    p @left
    p @middle
    p @right
  end

  def choose_tower(str)
    case str
    when "left"
      return @left
    when "middle"
      return @middle
    when "right"
      return @right
      # else
      #   return nil
    end
  end

  def move(start_tower, end_tower)
    return false if start_tower.empty?
    if !end_tower.empty?
      return false if start_tower.first > end_tower.first
    end
    end_tower.unshift(start_tower.shift)
    true
  end

  def won?
    return @left.empty? && @middle.empty? && @right == @right.sort
  end
end

# game = TowersOfHanoi.new(3)
# game.move(game.left, game.right)
# game.move(game.left, game.middle)
