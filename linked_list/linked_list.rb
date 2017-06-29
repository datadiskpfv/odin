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
    return @head if i == 0
    return @tail if i == (size - 1)

    current = @head
    i.times { current = current.next }
    return current
  end

  def pop
    current = at(@size - 2)
    current.next = nil
    @size -= 1
    @tail = current
  end

  def to_s
    list = ''
    (@size).times do |i|
      list << "(#{at(i).value.to_s})->"
    end
    return list << 'nil'
  end

  def contains?(c)
    (@size).times do |i|
      return true if at(i).value == c
    end

    return false
  end

  def find?(c)
    (@size).times do |i|
      return i if at(i).value == c
    end

    return nil
  end
end