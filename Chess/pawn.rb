require 'colorize'
require_relative 'Piece'
class Pawn < Piece
  
  def symbol
    "♟"
  end 
  
  def move_dirs
  end 
  
  private 
  
  def at_start_row? 
  end 
  
  def forward_dir
    #return 1 or -1 
  end 
  
  def forward_steps 
  end 
  
  def side_attacks
  end 
  
end