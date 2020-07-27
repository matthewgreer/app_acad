require_relative 'piece'
require_relative 'slideable'

class Queen < Piece
  include Slideable

  def symbol
    '♛'.colorize(color)
  end

  protected # private vs protected:
              # both can only be called w/in class definition
              # private: can only be used with implicit receiver (`self`)
              # protected: can be used with explicit receiver, specifically other instances of the same class or `self`

  # overrides the module's `#move_dirs` (later definition overwrites earlier ones)
  # this method is only used by the `moves` method; no need to expose this info outside the class
  def move_dirs 
    horizontal_and_vertical_dirs + diagonal_dirs
  end
end

# Queen < Slideable < Piece
# queen.moves --> self.move_dirs (where self is instance of the subclass)