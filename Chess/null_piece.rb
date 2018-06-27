require 'singleton'
require_relative 'piece'

class NullPiece < Piece
  include Singleton

  def initialize
    @color = :white 
  end 
  
  def symbol  
    " "
  end

  def nil?
    true
  end
end 