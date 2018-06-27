require 'colorize'
require_relative 'cursor'
require_relative 'board'

class Display
  attr_reader :cursor, :selected_pos
  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @selected_pos = nil 
  end

  def render
    system("clear")
    pos = cursor.cursor_pos # cursor instance getting input 
    (0..7).each {|n| print " #{n}".colorize(:light_white)}
    puts #to make the next row go to the next line 
    cursor.board.grid.each_with_index do |row, idx1|
      print "#{idx1}".colorize(:light_white)
      row.each_with_index do |piece, idx2|
        white_or_black = :light_yellow if (idx1.even? && idx2.odd?) ||
        (idx1.odd? && idx2.even?)
        white_or_black ||= :light_black
        if [idx1, idx2] == pos
          print piece.to_s.colorize(piece.color).colorize( :background => :blue).colorize(:mode => :blink)
        else
          print piece.to_s.colorize(piece.color).colorize( :background => white_or_black)
        end
      end
      puts
    end
  end
  
  def toggle_selected(pos)
    if pos == @selected_pos
      @selected_pos = nil 
    elsif @selected_pos.nil?
      @selected_pos = pos unless cursor.board[pos].nil?
    else 
      @cursor.board.move_piece(@selected_pos, pos) #an empty spot wont be selected
      @selected_pos = nil
    end 
  end 
  
  def test
    loop do
      render
      cursor_pos = cursor.get_input
      unless cursor_pos.nil?
        toggle_selected(cursor_pos)
      end
    end
  end
  
end
# checkmark = "\xF0\x9F\x91\xB8"
# print checkmark
# puts checkmark.encode('utf-8')

board = Board.new
display = Display.new(board)
display.test