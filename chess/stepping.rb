

module Stepping
  include Sliding
  KNIGHT_DIRS = [
    [1, 2],
    [-1, -2],
    [1, -2],
    [-1, 2],
    [2, 1],
    [-2, -1],
    [2, -1],
    [-2, 1],
  ]

  def knight_moves(pos)
    move_dirs(KNIGHT_DIRS, @pos)
  end

  def move_dirs(dirs, pos)
    moves = []

    cur_x, cur_y = pos
    dirs.each do |(dx, dy)|

      new_pos = [cur_x + (dx), cur_y + (dy)]

      if @board.in_bounds?(new_pos) == false
        next
      elsif @board[new_pos].color == self.color
        next
      else
        moves << new_pos
      end
    end

    moves
  end
end
