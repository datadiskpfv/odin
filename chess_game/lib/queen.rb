require_relative 'chess_piece'

class Queen < Chess_Piece

  def initialize(color)
    @name = 'Queen'
    @color = color
    @image = "\u2655"
  end

  def startup
    if @color == 'White'
      return 'A4'
    else
      return 'H4'
    end
  end
end