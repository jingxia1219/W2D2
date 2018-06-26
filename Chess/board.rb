require_relative 'piece'
require_relative 'null_piece'

class Board
  attr_accessor :grid
  def self.create_grid
    grid = Array.new(8) {Array.new(8) {NullPiece.instance}}
    queen = Piece.new
    king = Piece.new
    grid[0][3] = queen
    grid[0][4] = king
    grid
  end

  def initialize(grid = Board.create_grid)
    @grid = grid 
  end 
  
  def move_piece(start_pos, end_pos)
    piece = self[start_pos]
    raise ArgumentError.new("No piece at #{start_pos}") if piece.nil?
    raise ArgumentError.new("Piece at #{end_pos}") if !self[end_pos].nil?
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