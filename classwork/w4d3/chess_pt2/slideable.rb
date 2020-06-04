module Slideable

# HORIZONTAL_DIRS stores an array of horizontal directions
    # when a piece moves in a given direction, its row and/or its column should increment by some value
    # ex: A piece starts at position [1, 2] and it moves horizontally to the right
      # its position changes to [1,3]
      # the row increases by 0 and the column increases by 1

  HORIZONTAL_DIRS = [
    [0, -1], # left [0, -1]
    [0, 1], # right
    [-1, 0], # up (vertical)
    [1, 0]  # down (vertical)
  ].freeze

  # DIAGONAL_DIRS stores an array of diagonal directions
  DIAGONAL_DIRS = [
    [-1, -1], # up + left
    [-1, 1], # up + right
    [1, -1], # down + left
    [1, 1]  # down + right
  ].freeze


  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end


  # should return an array of places a Piece can move to
  def moves
    # create array to collect moves
    moves_arr = []
    # iterate over each of the directions in which a slideable piece can move
      # use the Piece subclass' `#move_dirs` method to get this info
      self.move_dirs.each do |dx, dy|
        moves_arr + grow_unblocked_moves_in_dir(dx, dy)
      end
      # for each direction, collect all possible moves in that direction
        # and add them to your moves array 
        # (use the `grow_unblocked_moves_in_dir` helper method)

    # return the final array of moves (containing all possible moves in all directions)
    moves_arr
  end


  private

  def move_dirs
    # subclass implements this
    raise NotImplementedError # this only executes if 
  end


  # this helper method is only responsible for collecting all moves in a given direction
  # the given direction is represented by two args, the combination of a dx and dy
  def grow_unblocked_moves_in_dir(dx, dy)
    # create an array to collect moves
    dir_moves = []
    # get the piece's current row and current column
    row, col = self.pos

    continue = true
    while continue 
      continue = false
        potential_move = [(row + dx), (col + dy)]
        break if @board.valid_position?(potential_move) 
        if @board[potential_move].is_a?(NullPiece)
          dir_moves << potential_move
          continue = true
        elsif @board[potential_move].color == self.color 
          continue = false
        else # other color piece
          dir_moves << potential_move
          continue = false
        end
      end

    # in a loop:
      # continually increment the piece's current row and current column to generate a new position
      # stop looping if the new position is invalid (not on the board); the piece can't move in this direction
      # if the new position is empty, the piece can move here, so add the new position to the moves array
      # if the new position is occupied with a piece of the opposite color, the piece can move here (to capture the opposing piece), so add the new position to the moves array
        # but, the piece cannot continue to move past this piece, so stop looping
      # if the new position is occupied with a piece of the same color, stop looping
    dir_moves
    # return the final moves array
  end
end




# Note: you can invoke methods from the piece from within the module methods, and vice versa. It is a two way street!

