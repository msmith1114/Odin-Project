class Node
  attr_accessor :x, :y, :children, :parent

  def initialize(x, y, parent=nil)
    @x = x
    @y = y
    @children = []
    @parent = parent
  end

  def make_children
    children = []
    children.push([@x + 2, @y - 1]).push([@x + 2, @y + 1]).
        push([@x + 1, @y -2]).push([@x + 1, @y + 2]).
        push([@x - 1, @y - 2]).push([@x - 1, @y + 2]).
        push([@x - 2, @y - 1]).push([@x - 2, @y + 1])
    children = children.select{|child| child[0] >= 0 && child[0] <= 7 && child[1] >= 0 && child[1] <= 7}
    @children = children.map {|child| Node.new(child[0],child[1],self)}
  end


end


def knight_moves(start,finish)
  queue = []
  node = Node.new(start[0],start[1])
  queue << node
  found = false
  until found == true do
    current = queue.shift
    if current.x == finish[0] && current.y == finish[1]
      found = true
      path = moves(start,finish,current)
      return "You made it in #{path.length-1} moves, here is your path: " +
      "#{path.reverse}"
    else
    current.make_children
    current.children.each {|child| queue << child}
    end
  end
end

def moves(start,finish,current)
  path = []
  path << [current.x,current.y]
  until current.x == start[0] and current.y == start[1] do
    current = current.parent
    path << [current.x,current.y]
  end
  return path
end

puts knight_moves([3,3],[4,3])
