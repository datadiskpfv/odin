require_relative 'chess_piece'

class King < Chess_Piece

  def initialize(color)
    @name = 'King'
    @color = color
    @image = color == 'White' ? "\u2654" : "\u265A"
  end

  def startup
    return @color == 'White' ? 'A5' : 'H5'
    #  return 'A5'
    #else
    #  return 'H5'
    #end
  end
end