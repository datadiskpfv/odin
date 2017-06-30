require './bnode.rb'

class Binary_Tree

  attr_accessor :root

  def initialize(node)
     @root = node
  end

  def insert(v)
    current_node = @root

    while current_node != nil
      if current_node.value == nil
        current_node.value = v
      elsif (v.to_i < current_node.value) && (current_node.left == nil)
        puts "left #{current_node.value} added #{v.to_i}"
        current_node.left = Bnode.new(current_node,nil,nil,v)
      elsif (v.to_i > current_node.value) && (current_node.right == nil)
        puts "right #{current_node.value} add #{v.to_i}"
        current_node.right = Bnode.new(current_node,nil,nil,v)
      elsif (v.to_i < current_node.value)
        current_node = current_node.left
      elsif (v.to_i > current_node.value)
        current_node = current_node.right
      elsif (v.to_i == current_node.value)
        puts "you already have #{v} value"
        return
      else
        return
      end
    end
  end

  def insert_array(a)
    current_node = @root

    while a.size != 0
      if current_node.value == nil
        puts "added #{a[0]} to empty binary tree"
        current_node.value = a.shift
      elsif (a[0].to_i < current_node.value) && (current_node.left == nil)
        puts "left #{current_node.value} added #{a[0].to_i}, node: #{current_node}"
        current_node.left = Bnode.new(current_node,nil,nil,a.shift)
        current_node = @root
      elsif (a[0].to_i > current_node.value) && (current_node.right == nil)
        puts "right #{current_node.value} add #{a[0].to_i}, node: #{current_node}"
        current_node.right = Bnode.new(current_node,nil,nil,a.shift)
        current_node = @root
      elsif (a[0].to_i < current_node.value)
        current_node = current_node.left
      elsif (a[0].to_i > current_node.value)
        current_node = current_node.right
      elsif (a[0].to_i == current_node.value)
        puts "you already have #{a[0]} value"
        a.shift
      else
        return
      end
    end
  end

  def bfs_search(v)
    current_node = @root

    found = false
    node_list = []

    while !found
      if (current_node.value == v)
        puts "Found your value #{v}, node is #{current_node} and value is #{current_node.value}"
        found = true
      else
        node_list = update_node_list(node_list,current_node)

        puts "Adding left node #{current_node.left.value} to node_list" if current_node.left != nil
        puts "right node #{current_node.right.value} to node_list" if current_node.right != nil
      end
      current_node = node_list.shift
    end
  end

  def bfs_display
    ## 6 4 10 2 5 7 11 1 3 9 8
    current_node = @root

    node_list = []
    values = []

    node_list = update_node_list(node_list,current_node)

    while !node_list.empty?
      values << current_node.value
      current_node = node_list.shift
      node_list = update_node_list(node_list,current_node)
    end

    values << current_node.value
    return values
  end

  def update_node_list(node_list, node)
    current_node = node
    node_list << current_node.left if current_node.left != nil
    node_list << current_node.right if current_node.right != nil
    return node_list
  end

  def dfs_preorder(current_node)
    ## 6 4 2 1 3 5 10 7 9 8 11
    print "#{current_node.value} "
    dfs_preorder(current_node.left) if current_node.left != nil
    dfs_preorder(current_node.right) if current_node.right != nil
  end

  def dfs_inorder(current_node)
    ## 1 2 3 4 5 6 7 8 9 10 11
    dfs_inorder(current_node.left) if current_node.left != nil
    print "#{current_node.value} "
    dfs_inorder(current_node.right) if current_node.right != nil
  end

  def dfs_postorder(current_node)
    ## 1 3 2 5 4 8 9 7 11 10 6
    dfs_postorder(current_node.left) if current_node.left != nil
    dfs_postorder(current_node.right) if current_node.right != nil
    print "#{current_node.value} "
  end
end