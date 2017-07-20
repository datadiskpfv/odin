require_relative 'chess_piece'

class Knight <Chess_Piece
  def initialize(color, name)
    @name = name
    @color = color
    @image = "\u2658"
  end

  def startup
    if @color == 'White'
      if @name == 'Knight1'
        return 'A2'
      else
        return 'A7'
      end
    else
      if @name == 'Knight1'
        return 'H2'
      else
        return 'H7'
      end
    end
  end
end