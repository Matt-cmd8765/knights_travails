require_relative 'knight'
require_relative 'algorithm'

class Board
  attr_accessor :board

  def initialize
    @board = self.make_board
  end

  def make_board
    arr1 = Array.new(64) { Array.new(2) }
    i = 0
    j = 0
    arr1.each do |sub_array|
      sub_array[0] = i
      sub_array[1] = j
      j += 1
      if j == 8
        j = 0
        i += 1
      end
    end
    arr1
  end

#class end don't delete dummy
end