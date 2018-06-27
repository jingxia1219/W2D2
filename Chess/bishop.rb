require 'colorize'

class Bishop < Piece
  
  def symbol
    "♝"
  end
  
  private
  def move_dirs
    diagonal_dirs
  end 
end