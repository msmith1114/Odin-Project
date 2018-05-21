class LinkedList

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(val) #add to END of list
    if @size == 0
      @head = Node.new(val)
      @tail = @head
      @size += 1
    else
      node = Node.new(val)
      @tail.next_node = node
      @tail = node
      @size += 1
    end
  end

  def prepend(val) #add to BEGINNING of list
    if @size == 0
      @head = Node.new(val)
      @tail = @head
      @size += 1
    else
      node = Node.new(val)
      node.next_node = @head
      @head = node
      @size += 1
    end
  end

  def size
    return @size
  end

  def head
    return @head
  end

  def tail
    return @tail
  end

  def contains?(val)
    if @size < 1
      return false
    end
    current = @head
    @size.times do
      if current.value == val
        return true
      end
      current = current.next_node
    end
    return false
  end

  def find(val)
    if @size < 1
      return nil
    end
    current = @head
    for i in 0..@size do
      if current.value == val
        return i
      end
      current = current.next_node
    end
    return nil

  end

  def at(index)
    if index > @size || index < 0
      return nil
    end
    current = @head
    index.times do
      current = current.next_node
    end
    current
  end

  def to_s
    string = ''
    current = @head
    @size.times do
      string += "( #{current.value} ) -> "
      current = current.next_node
    end
    string += 'nil'
    string
  end

  def pop
    if @size == 1
      @head = nil
      @tail = nil
    end
    current = @head
    until current.next_node == @tail
      current = current.next_node
    end
    @tail = current
    @tail.next_node = nil
    @size -= 1

  end

end


class Node
  attr_accessor :next_node, :value

  def initialize(value)
    @next_node = nil
    @value = value
  end
end

#Test
linked = LinkedList.new
linked.append(5)

linked.prepend(2)
linked.prepend(1)

linked.append(7)

linked.prepend(3)

linked.append(4)
linked.prepend(9)
linked.append(8)
puts linked.find(1)
puts linked.at(2)
puts linked.contains?(2)
puts linked.contains?(10)
#9 3 1 2 5 7 4 8
linked.pop
linked.append(1)
puts linked.to_s
linked.pop
puts linked.to_s
