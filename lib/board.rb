class Board
  attr_accessor :board

  def initialize
    @board = self.make_board
  end

  def add_edge(node_a, node_b)
    node_a.children << node_b
    node_b.children << node_a
  end

  private

  def make_board
    arr = Array.new(64) { Array.new(2) }
    i = 0
    j = 0
    arr.each do |sub_array|
      sub_array[0] = i
      sub_array[1] = j
      j += 1
      if j == 8
        j = 0
        i += 1
      end
    end
    make_hash_board(arr)
  end

  def make_hash_board(arr)
    hash = {}
    arr.each { |num| hash[num] = nil }
    hash
  end

# class end don't delete dummy
end