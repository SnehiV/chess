require_relative 'pieces'

class Board
  def initialize
    @grid = Array.new(8){ Array.new(8){ "   " } }
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, mark)
    x, y = pos
    @grid[x][y] = mark
  end

  def move_piece(from_pos, to_pos)
    piece = self[from_pos]
    if piece == NullPiece
      raise 'No piece here'
    elsif !(piece.moves.include?(to_pos))
      raise 'Not a valid move'
    else
      change_piece(from_pos, to_pos)
    end
  end

  def change_piece(from_pos, to_pos)
    self[to_pos] = self[from_pos]
    self[from_pos] = NullPiece.instance
  end

  def rows
    @grid
  end

  def in_bounds?(pos)
    pos.all? { |x| x.between?(0, 7) }
  end

  def empty?(pos)
    self[pos].is_a?(NullPiece)
  end

  def pos_query(pos)
    [self[pos].color, self[pos].symbol]
  end

  def populate
    populate_pawns
    populate_null_pieces
    populate_rooks
    populate_bishops
    populate_knights
    populate_queens
    populate_kings
  end
  def populate_null_pieces
    (2..5).each do |row|
      (0..7).each do |col|
        null_pos = [row, col]
        self[null_pos] = NullPiece.instance
      end
    end
  end

  def populate_pawns
    (0..7).each do |index|
      white_pawn_pos = [1, index]
      white_pawn = Pawn.new(:white, self, white_pawn_pos)
      self[white_pawn_pos] = white_pawn
    end

    (0..7).each do |index|
      black_pawn_pos = [6, index]
      black_pawn = Pawn.new(:black, self, black_pawn_pos)
      self[black_pawn_pos] = black_pawn
    end
  end

  def populate_rooks
    positions = [[0, 0], [7, 0], [0, 7], [7, 7]]
    positions.each do |pos|
      if pos[0] == 0
        self[pos] = Rook.new(:white, self, pos)
      else
        self[pos] = Rook.new(:black, self, pos)
      end
    end
  end

  def populate_bishops
    positions = [[0, 2], [0, 5], [7, 2], [7, 5]]
    positions.each do |pos|
      if pos[0] == 0
        self[pos] = Bishop.new(:white, self, pos)
      else
        self[pos] = Bishop.new(:black, self, pos)
      end
    end
  end

  def populate_knights
    positions = [[0, 1], [0, 6], [7, 1], [7, 6]]
    positions.each do |pos|
      if pos[0] == 0
        self[pos] = Knight.new(:white, self, pos)
      else
        self[pos] = Knight.new(:black, self, pos)
      end
    end
  end

  def populate_queens
    positions = [[0, 4], [7, 4]]
    positions.each do |pos|
      if pos[0] == 0
        self[pos] = Queen.new(:white, self, pos)
      else
        self[pos] = Queen.new(:black, self, pos)
      end
    end
  end

  def populate_kings
    positions = [[0, 3], [7, 3]]
    positions.each do |pos|
      if pos[0] == 0
        self[pos] = King.new(:white, self, pos)
      else
        self[pos] = King.new(:black, self, pos)
      end
    end
  end

end
