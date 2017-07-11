module SteppingPiece

  def moves()
    possible_moves = []

    move_dirs.each do |arr|
      possible_moves += grow_unblocked_moves_in_dir(arr)
    end

    possible_moves
  end

  def move_dirs
    case self.class.to_s
    when "King"
      [ [0, 1], [0, -1], [1, 1], [1, 0], [1, -1], [-1, 1], [-1, 0] [-1, -1] ]
    when "Knight"
      [ [-2, 1], [-2, -1], [-1, 2], [-1, -2], [2, 1], [1, 2], [1, -2] [2, -1] ]
    end
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    pos = []
    curr_pos = [self.pos[0] + dx, self.pos[1] + dy]

    if board.in_bounds(curr_pos)
      if board[curr_pos] == NullPiece
        pos << curr_pos
      else
        pos << curr_pos if board[curr_pos].color != self.color
      end
    end
    pos
  end


end
