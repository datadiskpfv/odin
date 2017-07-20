require '../lib/chess_piece'

class King < Chess_Piece

  def initialize(color)
    @name = 'King'
    @color = color
    @image = "\u2654"
  end

end