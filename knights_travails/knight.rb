class Knight
  attr_accessor :name

  moves = Array.new
  moves << [ (pos[0] + 1), (pos[1] + 2) ]
  moves << [ (pos(0) + 1, pos(1) - 2) ]
      [-1, -2], [-1, 2], [2, +1], [2, -1], [-2, -1], [-2, 1]]

  def initialize
    @name = 'knight'
  end

  def to_s
    return @name
  end
end