require "./node"

class LinkedList
  def initialize
    @head = nil
  end

  def each
    if @head.nil?
      return nil
    else
      current_node = @head
      until current_node.nil?
        yield(current_node)
        current_node = current_node.next_node
      end
    end
  end

  def append(val)
    current_node = @head
    if @head.nil?
      @head = Node.new(val)
    else
      current_node = current_node.next_node until current_node.next_node.nil?
      current_node.next_node = Node.new(val)
    end
  end

  def prepend(val)
    @head = Node.new(val, @head)
  end

  def size
    if @head.nil?
      return 0
    else
      s = 0
      each { |_| s+= 1 }
      s
    end
  end

  def head
    @head
  end

  def tail
    tail = nil
    each { |node| tail = node}
    tail
  end

  def at(i)
    j = 0
    node_at = nil
    each do |node|
      node_at = node if j == i
      j += 1
    end
    node_at
  end

  def pop
    each do |node|
      node.next_node = nil if node.next_node.next_node.nil?
    end
  end

  def contains?(val)
    ret = false
    each do |node|
      ret = true if node.value == val
    end
    ret
  end

  def find(val)
    index = nil
    i = 0
    each do |node|
      index = i if node.value == val
      i += 1
    end
    index
  end

  def to_s
    str = ''
    each do |node|
      str.concat("( #{node.value} ) -> ")
    end
    str.concat('nil')
  end
end
