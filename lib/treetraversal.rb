class Tree
  attr_accessor :payload, :children

  def initialize(payload, children)
    @payload = payload
    @children = children
  end

  # returns a node that contains the value 11 in the tree
  def depth_first(value_to_find)
    @children.each do |child|
      found_node = child.depth_first(value_to_find)
      if found_node != nil
        return found_node
      end
    end

    if payload == value_to_find
      return self
    else
      return nil
    end
  end

  # retuns a node that contains the value 11 in the tree
  def breadth_first(value_to_find)
    current_node = self
    queue = MyQueue.new 

    while current_node != nil
      if current_node.payload == value_to_find
        return current_node
      end
      current_node.children.each do |child|
        queue.enqueue(child)
      end
      current_node = queue.dequeue
    end
  end

end

class MyQueue
  def initialize
    @queue = []
  end

  def enqueue(item)
    @queue.push(item)
  end 

  def dequeue
    @queue.shift 
  end
end

# "Leafs" (elements that have no children)
deep_fifth_node = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node = Tree.new(4, [])

# "Branches" 
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [deep_fifth_node, eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
shallow_fifth_node = Tree.new(5, [ninth_node])

# "Trunk" (where the tree stems from)
root = Tree.new(2, [seventh_node, shallow_fifth_node])

puts root.depth_first(11).payload
puts root.breadth_first(11).payload