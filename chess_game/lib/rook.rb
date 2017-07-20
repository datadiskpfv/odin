require_relative 'chess_piece'

class Rook < Chess_Piece

  def initialize(color, name)
    @name = name
    @color = color
    @image = color == 'White' ? "\u2656" : "\u265C"
  end

  def startup
    if @color == 'White'
      return @name == 'Rook1' ? 'A1' : 'A8'
    else
      return @name == 'Rook1' ? 'H1' : 'H8'
    end
  end
end