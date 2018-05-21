class Node

  attr_accessor :value, :parent, :left, :right
  @@nodes = 0

  def self.nodes
    @@nodes
  end

  def initialize(value, parent=nil)
    @value = value
    @parent = parent
    @left = nil
    @right = nil
    @@nodes += 1
  end



end


class BinaryTree

  def initialize
    @root = nil
  end

  def build_tree(arr)
    arr.each {|el| add_child(el,@root)}
    @root
  end

  def add_child(value,node)
    if @root.nil?
      @root = Node.new(value)
    else
      if value < node.value
        node.left.nil? ? node.left = Node.new(value,node) : add_child(value,node.left)
      elsif value > node.value
        node.right.nil? ? node.right = Node.new(value,node) : add_child(value,node.right)
      end
    end
    return node
  end

  def breadth_first_search(el)
    queue = []
    queue << @root
    until queue.empty? do
      current = queue.shift
      if current.value == el
        return "Value found at #{current.to_s}"
      else
        queue << current.left unless current.left.nil?
        queue << current.right unless current.right.nil?
      end
    end
    return "Value not found...."
  end

  def bfs_print
    queue = []
    queue << @root
    until queue.empty? do
      current = queue.shift
      puts current.value
        queue << current.left unless current.left.nil?
        queue << current.right unless current.right.nil?
    end
  end

  def depth_first_search(el)
    stack = []
    stack.unshift(@root)
    until stack.empty?
      current = stack.shift
      if current.value == el
        return "Value found at #{current.to_s}"
      else
        stack.unshift(current.right) if current.right
        stack.unshift(current.left) if current.left
      end
    end
    return "Value not found...."


  end

  def dfs_rec_print(root=@root) #preorder
    if root == nil
      return
    end
    puts root.value
    dfs_rec_print(root.left)
    dfs_rec_print(root.right)
  end

  def dfs_rec(el,root=@root)
    if root.value == el
      return "Value found at #{root.to_s}"
    end

    left = dfs_rec(el,root.left) if root.left
    return left if left
    right = dfs_rec(el,root.right) if root.right
    return right if right
  end



end

tree = BinaryTree.new
tree.build_tree([6,3,8,11,2,5,4,9])

puts tree.breadth_first_search(2)
puts "--------------------------"
puts tree.dfs_rec(2)
puts "--------------------------"
tree.bfs_print
puts "--------------------------"
tree.dfs_rec_print
puts "--------------------------"
puts tree.depth_first_search(2)
