require_relative 'piece'
require_relative 'slideable'

class RookBishopQueen < Piece
    include Slideable

    def symbol
        @symbol
    end

    protected

    def move_dirs
      if self.symbol == :R
        return horizontal_dirs # <= [[0, -1], [0, 1]] etc.
      elsif self.symbol == :Q
        return horizontal_dirs + diagonal_dirs
      else 
        return diagonal_dirs
      end
    end

end