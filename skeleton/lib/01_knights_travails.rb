class KnightPathFinder

  attr_reader :considered_positions
  def initialize(pos)
    @start_pos = pos
    @self.root_node = PolyTreeNode.new(@start_pos)
    @considered_positions = [pos]
  end

  def self.valid_moves(pos)
    
  end

  def new_move_positions(pos)
    KnightPathFinder.valid_moves(pos).delete_if {|pos| considered_positions.include?(pos)}
  end
end