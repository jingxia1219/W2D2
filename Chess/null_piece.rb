require 'singleton'
require_relative 'piece'

class NullPiece < Piece
  include Singleton

  def to_s(color = :white)
    "_".colorize(color)
  end

  def nil?
    true
  end
end 