module Slideable
  
  HORIZONTAL_DIRS = {
    left: [0, -1],
    right: [0, 1],
    up: [-1, 0],
    down: [1, 0]
  }.freeze
  
  DIAGONAL_DIRS = {
    left_up: [-1,-1],
    left_down: [1, -1],
    right_up: [-1, 1],
    right_down: [1,1]
  }.freeze 
  
  def horizontal_dirs
      HORIZONTAL_DIRS
  end
  
  def diagonal_dirs
    DIAGONAL_DIRS
  end
  
  def moves
    directions = move_dirs
  end
  
  private
  def move_dirs
    
  end
  
  def grow_unblocked_moves_in_dir(dx, dy)
    
  end
end