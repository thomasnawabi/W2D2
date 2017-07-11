require_relative '../Piece.rb'
require_relative 'SteppingPiece'

class Knight < Piece

  include SteppingPiece

  def symbol
    '♞'.colorize(color)
  end

  def moves_diffs
    [ [-2, 1], [-2, -1], [-1, 2], [-1, -2], [2, 1], [1, 2], [1, -2] [2, -1], ]
  end



end
