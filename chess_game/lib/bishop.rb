require_relative 'chess_piece'

class Bishop < Chess_Piece

  def initialize(color, name)
    @name = name
    @color = color
    @image = "\u2657"
  end

  def startup
    if @color == 'White'
      if @name == 'Bishop1'
        return 'A3'
      else
        return 'A6'
      end
    else
      if @name == 'Bishop1'
        return 'H3'
      else
        return 'H6'
      end
    end
  end
end