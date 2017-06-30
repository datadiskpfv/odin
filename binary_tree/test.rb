require './bnode.rb'
require './binary_tree.rb'

## create a new blank binary tree, the root node is also blank
btree = Binary_Tree.new(Bnode.new(nil, nil, nil, nil))

## insert the first value
#btree.insert(6)
#p btree

## lets add the rest of the nodes
#[4, 10, 2, 5, 7, 11, 1, 3, 9, 8].each do |v|
#  btree.insert(v)
#end
#p btree

a1 = [6, 4, 10, 2, 5, 7, 11, 1, 3, 9, 8]
#a2 = [6, 4]
btree.insert_array(a1)

#btree.insert_array(a2)
#btree.insert(6)
#btree.insert(1)

#a3 = [13, 12]
#btree.insert_array(a3)
#p btree

#btree.bfs_search(9)
p btree.bfs_display
