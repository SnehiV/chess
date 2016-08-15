require 'colorize'
require_relative 'cursorable'
require_relative 'board'

class Display
  include Cursorable

  attr_accessor :board

  def initialize(board)
    @board = board
    @cursor_pos = [0, 0]
    @selected = false
  end

  def build_grid
    @board.rows.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def build_row(row, i)
    row.map.with_index do |piece, j|
      color_options = colors_for(i, j)
      piece.to_s.colorize(color_options)
    end
  end

  def colors_for(i, j)
    if [i, j] == @cursor_pos
      bg = :light_red
    elsif (i + j).odd?
      bg = :light_blue
    else
      bg = :blue
    end
    { background: bg, color: @board[[i, j]].color }
  end

  def render
    system("clear")
    p "Instructions"
    build_grid.each { |row| puts row.join }
  end
end
