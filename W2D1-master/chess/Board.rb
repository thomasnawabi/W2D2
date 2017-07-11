require 'byebug'
require_relative 'Piece.rb'
require_relative 'pieces.rb'
# require_relative 'pieces/null_piece.rb'
require 'colorize'


class Board
  attr_accessor :grid

  def initialize(grid = Board.empty_grid)

    @grid = grid
    # @null_piece
    @piece = Piece.new
    @null_piece = NullPiece.instance
    # @r = Rook.new
    # @n = Knight.new
    # @b = Bishop.new
    # @q = Queen.new
    # @k = King.new
    # @b = Bishop.new
    # @n = Knight.new
    # @r = Rook.new
    # @p = Pawn.new
  end

  def self.empty_grid
    Array.new(8) {Array.new(8) { NullPiece.instance } }
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, piece)
    x, y = pos
    @grid[x][y] = piece
  end

  def add_piece(piece, pos)
  end

  def dup()
  end



  def move_piece(start_pos, end_pos)
    piece = self[start_pos]
    self[end_pos] = piece
    self[start_pos] = NullPiece.instance
    render
  end

  def valid_pos?(pos)
    x, y = pos
    pos.all? {|coord| coord.between?(0, 7)}
  end

  def checkmate?()
  end

  def find_king(color)
  end

  def render
    puts "  #{(0..7).to_a.join(' ')}"
    @grid.each_with_index do |row, i|
      puts "#{i} #{row.join(' ')}"
    end
    puts "_________________________"
  end



  def populate
    pieces = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook, Pawn]
    @grid.each_index do |row|
      if row == 0
        debugger
        (0..7).each {|idx| @grid[row][idx] = pieces[idx].new(self, :white, [row, idx])}
      elsif row == 7
          (0..7).each {|idx| @grid[row][idx] = pieces[idx].new(self, :black, [row, idx + 1])}
      elsif row == 1 || row == 6
        (0..7).each {|idx| @grid[row][idx] = pieces[8]}
      end
    end
    @grid
  end

  def in_bounds(new_position)
    new_position.all? {|coord| coord.between?(0, 7)}
  end

end



# if __FILE__ == $PROGRAM_NAME
#   b = Board.new
#   b.populate
#  b.render
#  b.move_piece([0, 1], [2, 1])
#  # b.render
#
# end
