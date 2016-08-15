require_relative 'piece'

class Queen < Piece
  include Sliding

  def initialize(color, board, pos)
    super
    @symbol = '♛'
  end

  def moves
    diagonal_moves(@pos) + horizontal_moves(@pos) + vertical_moves(@pos)
  end
end
