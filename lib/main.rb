require_relative 'board'
require_relative 'knight'

board = Board.new
knight = Knight.new(board.board[15])

knight.root
knight.pretty_print
# arr = board.knight.location
# arr = [2,5]

# move_array = [[1,2],[2,1],[1,-2],[2,-1],[-2,-1],[-1,-2],[-2,1],[-1,2]]
# i = 0
# move_array.map! do |move|
#   move.map do |num|
#     new_num = num + arr[i]
#     i += 1
#     if i == 2
#       i = 0
#     end
#     new_num
#   end
# end

# move_array.insert(4,arr)

# p move_array

