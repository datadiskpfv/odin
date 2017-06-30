class Knight
  attr_accessor :name

  def moves(pos)
    moves = Array.new
    [0,1]
    moves << [(pos[0] + 1), (pos[1] + 2) ]
    moves << [(pos[0] + 1), (pos[1] - 2) ]
    moves << [(pos[0] - 1), (pos[1] - 2) ]
    moves << [(pos[0] - 1), (pos[1] + 2) ]
    moves << [(pos[0] + 2), (pos[1] + 1) ]
    moves << [(pos[0] + 2), (pos[1] - 1) ]
    moves << [(pos[0] - 2), (pos[1] - 1) ]
    moves << [(pos[0] - 2), (pos[1] + 1) ]
  end

  def initialize
    @name = 'knight'
  end

  def to_s
    return @name
  end
end