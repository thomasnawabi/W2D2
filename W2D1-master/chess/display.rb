require 'byebug'
require 'colorize'
require_relative 'cursor.rb'
require_relative 'Board.rb'

class Display

  attr_accessor :cursor, :board

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
  end

  def render
    system("clear")
    # debugger
    @board.grid.map.each_with_index do |row , x|
      row.map.with_index do |current_piece, y|
        if [x,y] == @cursor.cursor_pos
         print  current_piece.to_s.colorize(:color => :red, :background => :light_cyan)
       else
         print  current_piece.to_s.colorize(:black)
        end
      end
      print "\n"
    end
  end


  def loop_render
    while true
      render
      @cursor.get_input
    end
  end

end


if __FILE__ == $PROGRAM_NAME
  b = Board.new
  b.populate
  d = Display.new(b)
  d.loop_render

end
