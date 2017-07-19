require '../lib/chess_piece'

class King < Chess_Piece

  def initialize(color)
    @name = 'King'
    @color = color
    @start_location = starting_location(color)
  end

  def starting_location(color)
    if (color == 'white')
      location = square[0][4]
    else
      location = square[7][5]
    end
    return location
  end
end