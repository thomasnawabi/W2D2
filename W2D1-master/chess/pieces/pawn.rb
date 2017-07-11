require_relative '../Piece.rb'


class Pawn < Piece

  def symbol
    '♟'.colorize(:black)
  end

  def moves
    forward_steps + side_attacks
  end


  # def at_start_row?
  #   :color => :white if pos[0] == 1
  #   if self.color == :white && pos[0] == 1
  #     return true
  #   end
  #
  #   # false
  # end
  #
  # def forward_dir
  #
  # end

  def forward_steps
    pos = []
    curr_pos = [self.pos[0],self.pos[1]]
    if :white == self.color
      if self.pos[0] == 1
        pos << [self.pos[0],self.pos[1] + 1] if [self.pos[0],self.pos[1] + 1] == NullPiece
        pos << [self.pos[0],self.pos[1] + 2] if [self.pos[0],self.pos[1] + 2] == NullPiece
      else
        pos << [self.pos[0],self.pos[1] + 1] if [self.pos[0],self.pos[1] + 1] == NullPiece
      end
    else
      if self.pos[0] == 6
        pos << [self.pos[0],self.pos[1] - 1] if [self.pos[0],self.pos[1] - 1] == NullPiece
        pos << [self.pos[0],self.pos[1] - 2] if [self.pos[0],self.pos[1] - 2] == NullPiece
      else
        pos << [self.pos[0],self.pos[1] - 1] if [self.pos[0],self.pos[1] - 1] == NullPiece
      end
    end
    pos
  end


  def side_attacks
    side_pos = []
    poss_moves = [[1, 1], [-1, 1], [1, -1], [-1, -1 ]]
    curr_pos = self.pos

    if board[curr_pos].color != self.color
      [curr_pos[0] + poss_moves[0], curr_pos[1] + poss_moves[1]]
    end
    side_pos
  end

end
