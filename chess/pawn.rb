require_relative 'piece'
require 'byebug'

class Pawn < Piece
  include Stepping

  attr_accessor :moved

  def initialize(color, board, pos)
    @moved = false
    @symbol = "♟"
    super
  end


  def moves

    moves = vertical_moves(pos)
    unless @moved
      moves += moves.map{ |row, col| [(row + 1), col]}
      moves += moves.map{ |row, col| [(row - 1), col]}
      @moved = true
    end

    if self.color == :white
      moves.reject! { |move| move[0] < @pos[0] }
    elsif self.color == :black
      moves.reject! { |move| move[0] > @pos[0] }
    end

    moves.select! do |move|
      @board[move].is_a?(NullPiece)
    end

    moves + capture_moves(pos, self.color)
  end

  def capture_moves(pos, color)
    #if white => correct
    if color == :white
      capture_diffs = [[1, 1], [1, -1]]
    elsif color == :black
      capture_diffs = [[-1, -1], [-1, 1]]
    end

    moves = []

    cur_x, cur_y = pos
    capture_diffs.each do |(dx, dy)|
      new_pos = [(cur_x + dx), (cur_y + dy)]

      if @board.in_bounds?(new_pos) && @board[new_pos].color == self.opposite_color
        moves << new_pos unless moves.include?(new_pos)

        moves.reject do |move|
          @board.empty?(move) &&
          @board.pos_query(move)[0] == self.color
        end

      end
    end
    moves
  end
end
