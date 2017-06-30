require './bnode.rb'

def build_tree(a, n)

  current_node = n
  while a.size != 0

    #p a
    #puts "Processing: #{a[0]}"
    #while nil != current_node
      if (a[0].to_i < current_node.value) && (current_node.left == nil)
        puts "left #{current_node.value} added #{a[0].to_i}"
        current_node.left = Bnode.new(current_node,nil,nil,a.shift)
        current_node = n
      elsif (a[0].to_i > current_node.value) && (current_node.right == nil)
        puts "right #{current_node.value} add #{a[0].to_i}"
        current_node.right = Bnode.new(current_node,nil,nil,a.shift)
        current_node = n
      elsif (a[0].to_i < current_node.value)
        current_node = current_node.left
      elsif (a[0].to_i > current_node.value)
        current_node = current_node.right
      else
        return
      end
    #end

  end
end

#a1 = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
a1 = [6, 4, 10, 2, 5, 7, 11, 1, 9, 8]

node = Bnode.new(nil, nil, nil, a1.shift)

build_tree(a1, node)

p node

# p, l, r, v