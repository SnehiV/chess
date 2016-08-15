module Sliding

  HORIZONTAL_DIRS = [[0, 1], [0, -1]]
  VERTICAL_DIRS = [1, 0], [-1, 0]
  DIAGONAL_DIRS = [[-1, 1], [-1, -1], [1, -1], [1, 1]]

  def horizontal_moves(pos)
    move_dirs(HORIZONTAL_DIRS, pos)
  end

  def vertical_moves(pos)
    move_dirs(VERTICAL_DIRS, pos)
  end

  def diagonal_moves(pos)
    move_dirs(DIAGONAL_DIRS, pos)
  end

  def move_dirs(dirs, pos)
    moves = []

    cur_x, cur_y = pos
    dirs.each do |(dx, dy)|
      (1..7).each do |multiplier|
        # debugger
        new_pos = [cur_x + (multiplier * dx), cur_y + (multiplier * dy)]
        if @board.in_bounds?(new_pos) == false
          break
        elsif @board[new_pos].color == self.color
          break
        elsif @board[new_pos].class != NullPiece && @board[new_pos].color == self.opposite_color
          moves << new_pos if @board.in_bounds?(new_pos)
          break
        else
          moves << new_pos
        end
      end
    end

    moves
  end

end
