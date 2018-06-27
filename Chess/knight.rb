require 'colorize'
require_relative 'Stepable'
require_relative 'piece'

class Knight < Piece
  attr_reader :name
  include Stepable
  
  def symbol
    "♞"
  end

  # def to_s(color = :white)
  #   name.colorize(color)
  # end

end