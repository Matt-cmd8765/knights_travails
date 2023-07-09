require_relative 'board'
require_relative 'knight'

def add_edge_to_neighbors(array)
  array.map! do |move|
    node = GraphNode.new(move)
    node.possible_moves
  end
  array
end

board = Board.new
knight = Knight.new([2,6])
graph = Graph.new(knight.location)
graph.root.add_edge(knight.possible_moves)

p graph

