class Bnode
  attr_accessor :parent, :left, :right, :value

  def initialize(p, l, r, v)
    @parent = p
    @left = l
    @right = r
    @value = v
  end
end
