class Knight
  attr_accessor :name, :trail

  def moves(pos)
    moves = Array.new
    moves << [(pos[0] + 1), (pos[1] + 2) ] if check_move([(pos[0] + 1), (pos[1] + 2) ])
    moves << [(pos[0] + 1), (pos[1] - 2) ] if check_move([(pos[0] + 1), (pos[1] - 2) ])
    moves << [(pos[0] - 1), (pos[1] - 2) ] if check_move([(pos[0] - 1), (pos[1] - 2) ])
    moves << [(pos[0] - 1), (pos[1] + 2) ] if check_move([(pos[0] - 1), (pos[1] + 2) ])
    moves << [(pos[0] + 2), (pos[1] + 1) ] if check_move([(pos[0] + 2), (pos[1] + 1) ])
    moves << [(pos[0] + 2), (pos[1] - 1) ] if check_move([(pos[0] + 2), (pos[1] - 1) ])
    moves << [(pos[0] - 2), (pos[1] - 1) ] if check_move([(pos[0] - 2), (pos[1] - 1) ])
    moves << [(pos[0] - 2), (pos[1] + 1) ] if check_move([(pos[0] - 2), (pos[1] + 1) ])
    p moves
  end

  def check_move(m)
    x = m[0]
    y = m[1]
    #puts "X: #{x} Y: #{y}"
    if (x >= 0) && (x <= 7) && (y >= 0) && (y <= 7)
      #puts "Good Move: #{m}"
      return true
    end
    return false
  end

  def initialize(n)
    @name = n
    @trail = []
  end

  def to_s
    return @name
  end

  def add_trail(m)
    puts "Adding #{m}"
    @trail << m
  end

  def get_trail
    return @trail
  end
end