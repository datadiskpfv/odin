require_relative 'chess_piece'

class King < Chess_Piece

  def initialize(color)
    @name = 'King'
    @color = color
    @image = "\u2654"
  end

  def startup
    if @color == 'White'
      return 'A5'
    else
      return 'H5'
    end
  end
end