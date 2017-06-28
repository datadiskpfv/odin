require './node.rb'

def ordered_list(node)
  return nil if node == nil
  p node.value
  ordered_list(node.next)
end

def reverse_list(node)
  return nil if node == nil
  reverse_list(node.next)
  p node.value
end

def tail_list(node)
  return node if node.next == nil
  tail_list(node.next)
end

def add_list(head, value)
  tail_node = tail_list(head)
  tail_node.next = Node.new(value, nil)
end

def remove_list(head)
  tail_node = tail_list(head)
  tail_node.next = nil;
end

def count_list(node)
  count = 0
  return count if node.next == nil
  count += count
  tail_list(node.next)
end

## create the head node
head = Node.new(1, nil)

## create 8 other nodes
current = head

2.upto(8) { |n| current = current.next = Node.new(n, nil) }

## print all the nodes
puts "======================================"
ordered_list(head)
puts "======================================"
reverse_list(head)
puts "======================================"

puts "HEAD: #{head.value}"
tail = tail_list(head)
puts "TAIL: #{tail.value}"

puts "======================================"
add_list(head, 9)
ordered_list(head)

puts "======================================"
p count_list(head)