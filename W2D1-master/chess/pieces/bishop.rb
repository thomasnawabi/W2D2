require_relative '../Piece.rb'
require_relative 'SlidingPiece'

class Bishop < Piece

  include SlidingPiece

  def symbol
    '♝'.colorize(color)
  end

  def move_dirs

  end

  def moves_diffs
    [[1, 1], [1, - 1], [-1, 1], [-1, -1]]
  end



end
