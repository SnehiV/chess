require_relative 'piece'

class Rook < Piece
  include Sliding

  def initialize(color, board, pos)
    @symbol = '♜'
    super
  end

  def moves
    horizontal_moves(@pos) + vertical_moves(@pos)
  end
end
