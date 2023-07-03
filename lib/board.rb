require_relative 'algorithm'
require_relative 'knight'


class Board
  attr_accessor :board, :knight

  def initialize
    @board = self.make_board
  end

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
    arr
  end

  def knight_location(knight)
    @knight = knight
  end

# class end don't delete dummy
end
