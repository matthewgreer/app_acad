require_relative "piece"
require_relative "null_piece"

class Board

    attr_accessor :rows

    def initialize
        @rows = Array.new(8) {Array.new(8)}
        populate_board
        # private
        @sentinel = NullPiece.new
    end
    
    public

    def [](pos)
        row, col = pos
        @rows[row][col]
    end

    def []=(pos, value)
        row, col = pos
        @rows[row][col] = value
    end

    def move_piece(start_pos, end_pos) # make sure this doesn't need a color parameter
        if valid_position?(start_pos) && valid_position?(end_pos) && @rows[start_pos] != @sentinel && @rows[end_pos] == @sentinel
            return true
        else
            raise "invalid move"
        end
    end

    def valid_position?(pos)
        pos.each { |cord| return false if cord > 7 || cord < 0 }
        true   
    end

    def populate_board
      @rows.each.with_index do |row, i|
        row.map! do |col|
          if i == 0 || i == 1 || i == 6 || i == 7
            Piece.new 
          else
            @sentinel
          end
        end
      end
    end












end