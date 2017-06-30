class Square
  attr_accessor :contains

  def initialize
    @contains = nil
  end

  def place(p)
    @contains = p
  end
end