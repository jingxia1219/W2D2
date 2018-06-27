require 'colorize'
require_relative 'slideable'
require_relative 'piece'

class Queen < Piece
  include Slideable
  
  def symbol
    "♛"
  end

  private 
  
  def move_dirs
    horizontal_dirs.dup.merge(diagonal_dirs)
  end 
end