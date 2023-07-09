require_relative 'graph'
require_relative 'node'

class Knight
  attr_accessor :root

  def initialize(root)
    @root = root
  end

  # tree of possible moves
  def buildtree(array)
    return if array.empty?

    root = Node.new(array[array.size / 2])
    root.left_child = buildtree(array[0...array.size / 2])
    root.right_child = buildtree(array[(array.size / 2)+1..-1])
    root
  end

  # root command actually builds the tree, maybe change later?
  def root
    buildtree(self.possible_moves)
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right_child, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_child
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left_child, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_child
  end

  private

  def possible_moves(@root)
    base_move_array = [[-2,-1],[-2,1],[-1,-2],[-1,2],[1,-2],[1,2],[2,-1],[2,1]]
    i = 0
    base_move_array.map! do |move|
      move.map do |num|
        new_num = num + @root[i]
        i += 1
        i = 0 if i == 2
        new_num
      end
    end
    # insert current location into middle of array as root node. 
    new_arr = remove_off_board_values(base_move_array)
    new_arr.insert((new_arr.length/2),location) 
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

# class end don't delete
end

graph = Graph.new
knight = Knight.new([2,6])
moves = knight.possible_moves
graph.add_node(knight.location)
graph.nodes[0].add_edge(moves)
boobies = graph.nodes[0].neighbors
boobies.each do |num|
  knight.location = num
  moves = knight.possible_moves
  graph.add_node(knight.location)
end
graph.nodes[1].add_edge(graph.nodes[1].value)    
