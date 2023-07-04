require_relative 'algorithm'
require_relative 'node'

class Knight
  attr_accessor :location, :root

  def initialize(location)
    @location = location
  end

  def buildtree(array)
    return if array.empty?

    root = Node.new(array[array.size / 2])
    root.left_child = buildtree(array[0...array.size / 2])
    root.right_child = buildtree(array[(array.size / 2)+1..-1])
    root
  end

  # root command actually builds the tree, maybe change later?
  def root
    @root = buildtree(possible_moves(@location))
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right_child, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_child
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left_child, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_child
  end

  private

  def possible_moves(location)
    base_move_array = [[-2,-1],[-2,1],[-1,-2],[-1,2],[1,-2],[1,2],[2,-1],[2,1]]
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
    new_arr = remove_off_board_values(base_move_array)
    new_arr.insert((new_arr.length/2),location) 
  end

  def remove_off_board_values(array)
    array.map! do |move|
      move.map do |num|
        if num < 0 || num > 7
          num = nil
        end
        num
      end
    end
    new_arr = []
    array.each do |num|
      new_arr << num unless num.include?(nil)
    end
    p new_arr
  end


# class end don't delete
end
