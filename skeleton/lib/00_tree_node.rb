class PolyTreeNode
  attr_reader :parent, :children, :value

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(new_parent)
    return @parent = nil if new_parent.nil?
    old_parent = parent
    
    if !parent.nil?
      @parent = new_parent
      old_parent.children.delete(self)
      
    else
      # parent.children.shift
      @parent = new_parent
      
    end
    parent.children.push(self)
  end

  def add_child(child_node)
    child_node.parent=(self)
  end

  def remove_child(child_node)
    child_node.parent=(nil)
    raise "This is not a child" if !children.include?(child_node)
  end

  def dfs(target_value)
    
    return self if self.value == target_value
    children.each do |child|
      result = child.dfs(target_value)
      return result unless result.nil?
      # child.dfs(target_value)
    end
    nil
  end

  def bfs(target_value)
    queue = []
    queue.push(self)
    until queue.empty?
      node = queue.shift
      return node if node.value == target_value
      node.children.each do |child|
        queue.push(child)
      end
    end 
  end

end

# n1 = PolyTreeNode.new("root1")
# n2 = PolyTreeNode.new("root2")
# n3 = PolyTreeNode.new("root3")

# # connect n3 to n1
# n3.parent = n1
# # connect n3 to n2
# n3.parent = n2

# # this should work
# raise "Bad parent=!" unless n3.parent == n2
# raise "Bad parent=!" unless n2.children == [n3]

# # this probably doesn't
# raise "Bad parent=!" unless n1.children == []