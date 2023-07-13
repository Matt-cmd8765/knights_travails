require_relative 'board'
require_relative 'knight'


board = Board.new
knight = Knight.new([2,6])

graph = Graph.new


moves_arr = knight.possible_moves
sorted = moves_arr.sort.uniq
graph.add_vertex(knight.location)
graph.vertices.add_edge(knight.possible_moves)
root = graph.vertices
newy = []
root.neighbors.each do |vertex|
  vertex.add_edge(vertex.possible_moves)
end

p root.neighbors[0].neighbors[0]
# twoda = [[0,3], [0,5], [0,4]]

# p twoda.all?{ |a| sorted.include?(a) }

def moves(root, newy)
  if newy.length == 64
    return newy
  end
  other = []
  root.neighbors.each {|a| other << a.value}
  if other.all?{ |a| newy.include?(a) }
    return newy
  else
    root.neighbors.each {|a| newy << a.value}
  end

  root.neighbors.each do |vertex|
    vertex.add_edge(vertex.possible_moves)
    vertex.possible_moves.each { |move| newy << move}
  end
  sorted = newy.sort.uniq
  root = root.neighbors
  root.each { |x| moves(x,sorted)}
end

moves(root, newy)

newy

