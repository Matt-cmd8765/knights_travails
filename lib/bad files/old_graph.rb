class Vertex

  attr_accessor :value, :neighbors

  def initialize(value)
    @value = value
    @neighbors = []
  end

  def add_edge(neighbor)
    neighbor.each {|move| @neighbors << Vertex.new(move)}
  end

  def possible_moves
    base_move_array = [[-2,-1],[-2,1],[-1,-2],[-1,2],[1,-2],[1,2],[2,-1],[2,1]]
    i = 0
    base_move_array.map! do |move|
      move.map do |num|
        new_num = num + @value[i]
        i = 0 if i == 2
        new_num
      end
    end
    new_arr = remove_off_board_values(base_move_array)
    new_arr
  end

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

end

class Graph

  attr_accessor :vertices

  def initialize
    @vertices = []
  end

  def add_vertex(next_move)
    @vertices = Vertex.new(next_move)
  end

end