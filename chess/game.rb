require_relative 'board'
require_relative 'player'
require_relative 'display'
require 'pry'

class Game
  def initialize
    @board = Board.new
    @player = Player.new(@board)
  end

  def run
    @board.populate
    puts "move"
    until false
      begin
        from_pos = @player.move
        to_pos = @player.move
        @board.move_piece(from_pos, to_pos)
      rescue
        # debugger
        puts "Not a valid move"
        sleep(2)
        retry
      end
      @board[to_pos].pos = to_pos
      king = @board[[7, 3]]
      puts king.check?
      sleep(2)
    end
    puts "finished."
  end
end

binding.pry
