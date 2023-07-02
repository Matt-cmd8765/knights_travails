require_relative 'board'
require_relative 'knight'

board = Board.new
knight = Knight.new(board.board[22])

x = board.knight_location([2,6])
p x
arr = [-1,2]
i = 0
x.each do |move|
  puts move + arr[i]
  i += 1
end

