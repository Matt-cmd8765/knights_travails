require_relative 'knight'

class Board
  attr_accessor :root

  def initialize(node)
    @root = node
  end

  def knight_moves (start, destination)
    current = make_moves(start, destination)
    history = []
    make_hist(current, history, start)
    print_knight_moves(history, start, destination)
  end

  private

  def make_moves(start, destination)
    queue = [Knight.new(start)]
    current = queue.shift
    until current.location == destination
      current.possible_moves.each do |move|
        current.children << knight = Knight.new(move, current)
        queue << knight
      end
      current = queue.shift
    end
    current
  end

  def make_hist(current, hist, start)
    until current.location == start
      hist << current.location
      current = current.parent
    end
    hist << current.location
  end

  def print_knight_moves(history, start, destination)
    puts "You made it in #{history.size - 1} moves!"
    puts "To get from #{start} to #{destination} you must traverse the following path:"
    history.reverse.each { |move| puts move.to_s }
  end

end