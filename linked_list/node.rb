class Node
  attr_accessor :value, :next

  def initialize(v, n)
    @value = v
    @next = n
  end

  def add_node(n)
    @next = n;
  end
end