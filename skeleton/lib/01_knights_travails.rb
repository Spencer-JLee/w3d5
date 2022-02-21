require_relative "00_tree_node.rb"

class KnightPathFinder
  
  MOVES = [[1,2], [-1,2], [2,1], [-2,1], [2,-1], [-2,-1], [1,-2], [-1,-2]]

  attr_reader :considered_positions
  def initialize(start_pos)
    @start_pos = start_pos
    @root_node = PolyTreeNode.new(@start_pos)
    @considered_positions = [start_pos]
    build_move_tree
  end

  def self.valid_moves(pos)
    arr = []
    MOVES.each do |move|
      if (move[0]+pos[0]) <= 7 &&
        (move[1]+pos[1]) <= 7 &&
        (move[0]+pos[0]) > -1 && 
        (move[1]+pos[1]) > -1
        arr << [move[0]+pos[0], move[1]+pos[1]]
      end
    end
    arr
  end

  def new_move_positions(pos)
    new_moves = KnightPathFinder.valid_moves(pos).delete_if {|pos| considered_positions.include?(pos)}
    considered_positions.concat(new_moves)
    new_moves
  end

  def build_move_tree
    queue = []
    queue.push(@root_node)
    until queue.empty?
      node = queue.shift
      nodes_pos = new_move_positions(node.value)
      nodes_pos.each do |pos|
        new_node = PolyTreeNode.new(pos)
        node.add_child(new_node)
        queue.push(new_node)
      end
    end
  end

  def find_path(end_pos)
    target = @root_node.dfs(end_pos)
    trace_path_back(target)
  end

  def trace_path_back(node)
    arr = [node.value]
    return arr if node.parent.nil?
    parent = node.parent
    trace_path_back(parent) + arr
  end

end

k = KnightPathFinder.new([0, 0])
p k.find_path([7, 6])
p k.find_path([6, 2])