require_relative 'graph'

class Knight
  attr_accessor :graph, :location

  def initialize(location)
    @location = location
  end

  def change_location(location)
    @location = location
  end

  def possible_moves
    base_move_array = [[-2,-1],[-2,1],[-1,-2],[-1,2],[1,-2],[1,2],[2,-1],[2,1]]
    i = 0
    base_move_array.map! do |move|
      move.map do |num|
        new_num = num + @location[i]
        i += 1
        i = 0 if i == 2
        new_num
      end
    end
    # insert current location into middle of array as root node. 
    new_arr = remove_off_board_values(base_move_array)
    new_arr.map! do |x|
      nod = GraphNode.new(x)
      nod.possible_moves
      nod
    end
  end

  private

  def remove_off_board_values(array)
    array.map! do |move|
      move.map do |num|
        num = nil if num < 0 || num > 7
        num
      end
    end
    new_arr = []
    array.each do |num|
      new_arr << num unless num.include?(nil)
    end
    new_arr
  end

# class end don't delete
end
