require_relative 'piece'

class Knight < Piece
  include Stepping

  def initialize(color, board, pos)
    super
    @symbol = '♞'
  end

  def moves
    knight_moves(@pos)
  end
end
