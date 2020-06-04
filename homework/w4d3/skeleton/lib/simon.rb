# I passed all specs, but game was still completely dysfunctional.


require 'byebug'

class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @game_over = false
    @seq = []
    @sequence_length = 1
  end

  def play
    until @game_over == true
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    # if guess == seq
    round_success_message
    @sequence_length += 1
    # @game_over = true
    # game_over_message
  end

  def show_sequence
    add_random_color
    system("clear")
    @seq.each do |color|
    puts color
    sleep 1
    system("clear")
    puts
    end
  end

  def require_sequence
    puts
    puts "Now you repeat what Simon said." 
    puts "Enter each color in the sequence, one at a time"
    puts "pressing 'return' after each color name."
    @seq.each do |color|
      guess = gets.chomp
      if guess != color
        game_over = true
        break
      end
    end
    sleep 1
  end

  def add_random_color
    @seq.push(COLORS.sample)
  end

  def round_success_message
    puts
    puts "Nice! Now Simon Says... "
  end

  def game_over_message
    puts
    puts "Simon didn't say that! Game Over!"
    puts "Rounds: #{sequence_length - 1}"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end