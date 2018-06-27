require_relative 'piece'
require_relative 'null_piece'

require_relative 'queen'
require_relative 'king'
require_relative 'pawn'
require_relative 'knight'
require_relative 'bishop'
require_relative 'rook'

class Board
  attr_accessor :grid

  BLACK_TEAM = [
    Rook.new(:black),
    Knight.new(:black),
    Bishop.new(:black),
    Queen.new(:black),
    King.new(:black),
    Bishop.new(:black),
    Knight.new(:black),
    Rook.new(:black)
  ]
  
  WHITE_TEAM = [
    Rook.new(:white),
    Knight.new(:white),
    Bishop.new(:white),
    King.new(:white),
    Queen.new(:white),
    Bishop.new(:white),
    Knight.new(:white),
    Rook.new(:white)
  ]

  def self.create_grid
    grid = Array.new(8) {Array.new(8) {NullPiece.instance}}
    grid[0] = BLACK_TEAM.dup
    grid[7] = WHITE_TEAM.dup
    grid[6] = Array.new(8) {Pawn.new(:white)}
    grid[1] = Array.new(8) {Pawn.new(:black)}
    grid
  end
  
  def initialize(grid = Board.create_grid)
    @grid = grid 
  end 
  
  def move_piece(start_pos, end_pos)
    piece = self[start_pos]
    raise ArgumentError.new("No piece at #{start_pos}") if piece.nil?
    self[end_pos] = piece 
    self[start_pos] = NullPiece.instance 
  end
  
  def valid_pos?(pos)
    pos.all? {|el| el.between?(0,7)}
  end 
  
  def []=(pos, value)
    x,y = pos
    @grid[x][y] = value 
  end 
  
  def [](pos)
    x, y = pos
    @grid[x][y]
  end 
  
end