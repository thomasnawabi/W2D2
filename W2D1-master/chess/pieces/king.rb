require_relative '../Piece.rb'
require_relative 'SteppingPiece'

class King < Piece

  include SteppingPiece


  def symbol
    '♚'.colorize(color)
  end

  def moves_diffs
    [ [0, 1], [0, -1], [1, 1], [1, 0], [1, -1], [-1, 1], [-1, 0] [-1, -1], ]
  end



end
