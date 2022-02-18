require_relative "00_tree_node_spec.rb"

class KnightPathFinder
  
  MOVES = [[1,2], [-1,2], [2,1], [-2,1], [2,-1], [-2,-1], [1,-2], [-1,-2]]

  attr_reader :considered_positions
  def initialize(start_pos)
    @start_pos = start_pos
    @self.root_node = PolyTreeNode.new(@start_pos)
    @considered_positions = [start_pos]
  end

  def self.valid_moves(pos)
    
  end

  def new_move_positions(pos)
    new_moves = KnightPathFinder.valid_moves(pos).delete_if {|pos| considered_positions.include?(pos)}
    considered_positions + new_moves
    new_moves
  end



end