class King < Piece
  include Stepping

  def initialize(color, board, pos)
    super
    @symbol = '♚'
  end

  def moves
    diagonal_moves(@pos) + horizontal_moves(@pos) + vertical_moves(@pos)
  end

  def enemy_pieces
    enemy_pieces = []
    @board.rows.each do |row|
      row.each do |piece|
         if piece.color != self.color && piece.color != :no_color
           enemy_pieces << piece
        end
      end
    end
    enemy_pieces
  end

  def check?
    enemies = enemy_pieces
    enemies.each do |enemy|
      enemy_moves = enemy.moves
      return enemy_moves.include?(self.pos)
    end
  end
end
