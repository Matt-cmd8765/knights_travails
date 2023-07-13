require_relative 'knight'
require_relative 'board'
require_relative 'bfs'
board = Board.new
space = board.board

board.board.keys().each do |key|
  knight = Knight.new(key)
  knight.possible_moves
  board.board[key] = knight
end

#board.board[[7,1]]
start = space[[2,6]]
moves = start.possible_moves
moves.each do |move|
  board.add_edge(start, space[move])
end

# start.children.each do |child|
#   space[child.location]
#   start = space[child.location]
#   moves = start.possible_moves
#   moves.each do |move|
#     board.add_edge(start, space[move])
#   end
# end


bfs = BreadthFirstSearch.new(start)
p bfs.shortest_path_to(space[[0,5]])




