class Piece

attr_accessor :pos
attr_reader :reader, :board, :symbol

  def initialize(color, symbol, board, position)
    @color = color
    @symbol = symbol
    @board = board
    @pos = position
  end 
#  def moves
#  end   
  def empty? # Ask if we have access to sentinal even tho it is set as private.
    color == :grey
  end
end 