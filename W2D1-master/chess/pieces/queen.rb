require_relative '../Piece.rb'
require_relative 'SlidingPiece'

class Queen < Piece

  include SlidingPiece

  def symbol
    '♛'.colorize(color)
  end



end
