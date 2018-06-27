require 'colorize'
require_relative 'Stepable'
require_relative 'piece'

class King < Piece
  include Stepable
  
  def symbol
    "♚"
  end
end