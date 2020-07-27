module Slideable
  HORIZONTAL_AND_VERTICAL_DIRS = [
    [-1, 0],
    [0, -1],
    [0, 1],
    [1, 0]
  ].freeze

  DIAGONAL_DIRS = [
    [-1, -1],
    [-1, 1],
    [1, -1],
    [1, 1]
  ].freeze

  def horizontal_and_vertical_dirs
    HORIZONTAL_AND_VERTICAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves
    moves = []

    # iterate through each direction the piece can slide in
    move_dirs.each do |dx, dy|  # each direction has two dimensions: a dx and a dy
      moves.concat(grow_unblocked_moves_in_dir(dx, dy))
    end

    moves
  end

  private

  def move_dirs
    # subclass implements this
    raise NotImplementedError
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    cur_x, cur_y = pos
    moves = []

    # keep moving in one direction until forced to stop
    loop do
      cur_x, cur_y = cur_x + dx, cur_y + dy # increment current pos by current direction
      pos = [cur_x, cur_y]

      # check 1: on the board?
      break unless board.valid_pos?(pos)

      # check 2: empty spot?
      if board.empty?(pos)
        moves << pos
      else
        # can take an opponent's piece (check 3: opponent's color?)
        moves << pos if board[pos].color != color

        # can't move past blocking piece
        break
      end
    end
    moves # => returns to moves
  end
end
