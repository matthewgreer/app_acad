require "byebug"

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14)
    self.place_stones
    @player1 = name1
    @player2 = name2
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.map!.with_index do |cup, i|
      if i == 6 || i == 13
        cup = []
      else
        cup = [:stone, :stone, :stone, :stone]
      end
    end
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' if start_pos < 0 || start_pos == 6 || start_pos > 12
    raise 'Starting cup is empty' if @cups[start_pos].empty?

  end

  def make_move(start_pos, current_player_name)
    start_cup_stones = @cups[start_pos].length
    ending_cup_idx = start_pos
    (1..start_cup_stones).each do |step|
      # debugger
      new_idx = (start_pos + step) % 14
      new_idx = 0 if current_player_name == @player1 && new_idx == 13
      new_idx = 7 if current_player_name == @player2 && new_idx == 6
      @cups[new_idx].push(@cups[start_pos].shift)
      ending_cup_idx = new_idx
    end
    self.render
    self.next_turn(ending_cup_idx)
  end

  def next_turn(ending_cup_idx) #, current_player_name = nil)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    return :switch if @cups[ending_cup_idx].length == 1
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13
    ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all?(&:empty?) || @cups[7..12].all?(&:empty?)
  end

  def winner
    player1_score = @cups[6].length
    player2_score = @cups[13].length
    case player1_score <=> player2_score
    when 1
      @player1
    when 0
      :draw
    when -1
      @player2
    end
  end
end

