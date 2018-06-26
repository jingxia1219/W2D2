require 'colorize'
require_relative 'cursor'
require_relative 'board'

class Display
  attr_reader :cursor, :selected_pos
  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @selected_pos = []
  end

  def render
    system("clear")
    pos = cursor.cursor_pos
    cursor.board.grid.each_with_index do |row, idx1|
      print "|  ".colorize(:white)
      row.each_with_index do |piece, idx2|
        white_pipe = "  |  ".colorize(:white)
        if pos == [idx1, idx2]
          print piece.to_s(:red)
          print white_pipe
        else
          print piece
          print white_pipe
        end
      end
      puts
    end
  end
  
  def toggle_selected(pos)
    @selected_pos = pos
  end
  
  def test
    loop do
      cursor_pos = cursor.get_input
      unless cursor_pos.nil?
        toggle_selected(cursor_pos)
      end
      render
    end
  end
  
end

board = Board.new
display = Display.new(board)
display.test