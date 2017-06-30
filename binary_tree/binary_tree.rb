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
        puts "left #{current_node.value} added #{a[0].to_i}"
        current_node.left = Bnode.new(current_node,nil,nil,a.shift)
        current_node = @root
      elsif (a[0].to_i > current_node.value) && (current_node.right == nil)
        puts "right #{current_node.value} add #{a[0].to_i}"
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
end