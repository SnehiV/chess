require_relative 'piece'

class Bishop < Piece
  include Sliding

  def initialize(color, board, pos)
    @symbol = '♝'
    super
  end

  def moves
    diagonal_moves(@pos)
    # reject hit piece = value
    # reject every value comes after hit piece value
  end

end
