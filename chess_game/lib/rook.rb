require_relative 'chess_piece'

class Rook < Chess_Piece

  def initialize(color, name)
    @name = name
    @color = color
    @image = "\u2656"
  end

  def startup
    if @color == 'White'
      if @name == 'Rook1'
       return 'A1'
      else
        return 'A8'
      end
    else
      if @name == 'Rook1'
        return 'H1'
      else
        return 'H8'
      end
    end
  end
end