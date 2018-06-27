require 'colorize'

class Piece
  attr_reader :name, :color, :symbol
  
  def initialize(color=:green, board=nil, pos=nil)
    @pos = pos
    @color = color
    @board = board
  end
  
  def symbol 
    "♕"
  end
  
  def to_s
    "#{symbol} "
  end

  def empty?
    
  end
  
  def valid_moves
  
  end
  
  def pos=(val)
  
  end
  
  private
  def move_into_check?(end_pos)
  
  end
end
