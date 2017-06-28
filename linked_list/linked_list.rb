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

## create the head node
head = Node.new(1, nil)

## create 8 other nodes
current = head
2.upto(8) { |n| current = current.add_node(Node.new(n, nil)) }

## print all the nodes
ordered_list(head)
reverse_list(head)