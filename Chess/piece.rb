require 'colorize'

class Piece
  attr_reader :name
  
  def initialize(name = "P")
    @name = name
  end

  def to_s(color = :white)
    name.colorize(color)
  end

end
