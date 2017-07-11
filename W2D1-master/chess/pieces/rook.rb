require_relative '../Piece.rb'
require_relative 'SlidingPiece'

class Rook < Piece
  include SlidingPiece

  def symbol
    '♜'.colorize(color)
  end

  protected

end
