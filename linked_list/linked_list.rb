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
      p "h"
      current = current.next
    end
    return current
  end
end