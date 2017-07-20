require_relative 'chess_piece'

class Queen < Chess_Piece

  def initialize(color)
    @name = 'Queen'
    @color = color
    @image = color == 'White' ? "\u2655" : "\u265B"
  end

  def startup
    return @color == 'White' ? 'A4' : 'H4'
  end
end