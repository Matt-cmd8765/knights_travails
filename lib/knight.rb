require_relative 'algorithm'
require_relative 'node'

class Knight
  attr_accessor :location, :root

  def initialize(location)
    @location = location
  end

  def possible_moves(location)
    base_move_array = [[1,2],[2,1],[1,-2],[2,-1],[-2,-1],[-1,-2],[-2,1],[-1,2]]
    i = 0
    base_move_array.map! do |move|
      move.map do |num|
        new_num = num + location[i]
        i += 1
        if i == 2
          i = 0
        end
        new_num
      end
    end
    # insert current location into middle of array as root node. 
    base_move_array.insert(4,location)
  end

  def buildtree(array)
    return if array.empty?

    root = Node.new(array[array.size / 2])
    root.left_child = buildtree(array[0...array.size / 2])
    root.right_child = buildtree(array[(array.size / 2)+1..-1])
    root
  end

  def root
    @root = buildtree(possible_moves(@location))
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right_child, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_child
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left_child, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_child
  end


end