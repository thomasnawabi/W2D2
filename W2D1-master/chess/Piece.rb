

class Piece

  attr_reader :board, :color
  attr_accessor :pos

  def initialize(board, color, pos)
    # @piece = 'A'
    @pos = pos

  end

  def to_s
    '_'
  end

  def moves

  end

  def empty?
  end

  def symbol
  end

  def valid_moves
  end

  def move_in_to_check(to_pos)
  end
end
