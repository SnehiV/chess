require_relative 'piece'
require 'singleton'

class NullPiece
  include Singleton

  def to_s
    symbol
  end

  def color
    :no_color
  end

  def symbol
    "   "
  end

  def opposite_color
    :no_color
  end

end
