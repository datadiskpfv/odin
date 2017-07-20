require_relative 'chess_piece'

class Knight <Chess_Piece
  def initialize(color, name)
    @name = name
    @color = color
    @image = color == 'White' ? "\u2658" : "\u265E"
  end

  def startup
    if @color == 'White'
      return @name == 'Knight1' ? 'A2' : 'A7'
    else
      return @name == 'Knight1' ? 'H2' : 'H7'
    end
  end
end