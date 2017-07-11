require_relative '../Board.rb'

module SlidingPiece



  def moves()
    possible_moves = []

    move_dirs.each do |arr|
      possible_moves += grow_unblocked_moves_in_dir(arr)
    end

    possible_moves
  end

  def move_dirs
    case self.class.to_s
    when "Bishop"
      diagonal_dirs
    when "Rook"
      horizontal_dirs
    when "Queen"
      horizontal_dirs + diagonal_dirs
    end
  end

  def horizontal_dirs
    [[1, 0], [0, 1], [0, -1], [-1, 0]]
  end

  def diagonal_dirs
    [[1, 1], [1, - 1], [-1, 1], [-1, -1]]
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    pos = []
    curr_pos = [self.pos[0] + dx, self.pos[1] + dy]

    while board.in_bounds(curr_pos)
      if board[curr_pos] == NullPiece
        pos << curr_pos
      else
        pos << curr_pos if board[@curr_pos].color != self.color
        break
      end
      curr_pos = [curr_pos[0] + dx, curr_pos[1] + dy]
    end
    pos
  end
end
