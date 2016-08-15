require_relative 'sliding'
require_relative 'stepping'
require 'colorize'

class Piece
  attr_accessor :pos, :color, :board

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def to_s
    " #{@symbol} "
  end

  def opposite_color
    if self.color == :white
      :black
    else self.color == :black
      :white
    end
  end

end
