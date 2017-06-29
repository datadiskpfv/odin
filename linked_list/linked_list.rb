require './node.rb'

class LinkedList
  attr_accessor :size, :head, :tail

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(v)
    if size == 0
      @head = Node.new(v, nil)
      @tail = @head
    else
      node = Node.new(v, nil)
      @tail.next = node
      @tail = node
    end
    @size += 1
  end

  def prepend(v)
    if size == 0
      @head = Node.new(v, nil)
      @tail = @head
    else
      @head = Node.new(v, @head)
    end
    @size += 1
  end

  def size
    @size
  end

  def head
    @head
  end

  def tail
    @tail
  end

  def at(i)
    current = @head
    i.times do
      current = current.next
    end
    return current
  end

  def pop
    current = @head
    (@size - 2).times do
      current = current.next
    end
    @size -= 1
    current.next = nil
    @tail = current
  end

  def to_s
    list = []
    current = @head
    list << current.value
    (@size - 1).times do
      current = current.next
      list << current.value
    end
    return list
  end

  def contains?(c)
    current = @head
    if current.value == c
      return true
    end

    (@size - 1).times do
      current = current.next
      if current.value == c
        return true
      end
    end

    return false
  end

  def find?(c)
    current = @head
    if current.value == c
      return 0
    end

    (@size - 1).times do |i|
      current = current.next
      if current.value == c
        return i + 1
      end
    end

    return nil
  end
end