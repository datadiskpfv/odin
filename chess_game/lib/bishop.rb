require_relative 'chess_piece'

class Bishop < Chess_Piece

  def initialize(color, name)
    @name = name
    @color = color
    @image = color == 'White' ? "\u2657" : "\u265D"
  end

  def startup
    if @color == 'White'
      return @name == 'Bishop1' ? 'A3' : 'A6'
    else
      return @name == 'Bishop1' ? 'H3' : 'H6'
    end
  end
end