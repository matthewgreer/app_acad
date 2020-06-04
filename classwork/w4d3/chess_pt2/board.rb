require_relative "piece"
require_relative "null_piece"
require_relative "rook_bishop_queen"
require_relative "knight_king"
require_relative "pawn"
require "byebug"

class Board

    attr_accessor :rows

    def initialize
        @rows = Array.new(8) {Array.new(8)}
        @sentinel = NullPiece.instance
        populate_board
    end
    
    def [](pos)
        row, col = pos
        @rows[row][col]
    end

    def []=(pos, value)
        row, col = pos
        @rows[row][col] = value
    end

    def move_piece(start_pos, end_pos) # refactor for capturing, with color arg?
        if valid_position?(start_pos) && valid_position?(end_pos) && self[start_pos] != @sentinel && self[end_pos] == @sentinel
          self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
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
            Piece.new(:green, :wtf, self, nil) 
          else
            sentinel 
          end
        end
      end
      place_rooks
      place_bishops
      place_queens
      place_knights
      place_kings
      place_pawns
    end

    def place_rooks
      self[[0, 0]] = RookBishopQueen.new(:white, :R, self, [0, 0])
      self[[0, 7]] = RookBishopQueen.new(:white, :R, self, [0, 7])
      self[[7, 0]] = RookBishopQueen.new(:black, :R, self, [7, 0])
      self[[7, 7]] = RookBishopQueen.new(:black, :R, self, [7, 7])
    end

    def place_bishops
      self[[0, 2]] = RookBishopQueen.new(:white, :B, self, [0, 2])
      self[[0, 5]] = RookBishopQueen.new(:white, :B, self, [0, 5])
      self[[7, 2]] = RookBishopQueen.new(:black, :B, self, [7, 2])
      self[[7, 5]] = RookBishopQueen.new(:black, :B, self, [7, 5])
    end

    def place_queens
      self[[0, 4]] = RookBishopQueen.new(:white, :Q, self, [0, 4])
      self[[7, 4]] = RookBishopQueen.new(:black, :Q, self, [7, 4])
    end

    def place_knights
      self[[0, 1]] = KnightKing.new(:white, :N, self, [0, 1])
      self[[0, 6]] = KnightKing.new(:white, :N, self, [0, 6])
      self[[7, 1]] = KnightKing.new(:black, :N, self, [7, 1])
      self[[7, 6]] = KnightKing.new(:black, :N, self, [7, 6])
    end

    def place_kings
      self[[0, 3]] = KnightKing.new(:white, :K, self, [0, 3])
      self[[7, 3]] = KnightKing.new(:black, :K, self, [7, 3])
    end

    def place_pawns
      (0..7).each do |col|
        self[[1, col]] = Pawn.new(:white, :P, self, [1, col])
        self[[6, col]] = Pawn.new(:black, :P, self, [6, col])
      end
    end

private
attr_reader :sentinel

end