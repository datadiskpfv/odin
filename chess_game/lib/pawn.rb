require_relative 'chess_piece'

class Pawn <Chess_Piece
  def initialize(color, name)
    @name = name
    @color = color
    @image = color == 'White' ? "\u2659" : "\u265F"
  end

  def startup
    if @color == 'White'
      case @name
        when 'Pawn1'
          return 'B1'
        when 'Pawn2'
          return 'B2'
        when 'Pawn2'
          return 'B2'
        when 'Pawn3'
          return 'B3'
        when 'Pawn4'
          return 'B4'
        when 'Pawn5'
          return 'B5'
        when 'Pawn6'
          return 'B6'
        when 'Pawn7'
          return 'B7'
        when 'Pawn8'
          return 'B8'
      end
    else
      case @name
        when 'Pawn1'
        return 'G1'
        when 'Pawn2'
        return 'G2'
        when 'Pawn2'
        return 'G2'
        when 'Pawn3'
        return 'G3'
        when 'Pawn4'
        return 'G4'
        when 'Pawn5'
        return 'G5'
        when 'Pawn6'
        return 'G6'
        when 'Pawn7'
        return 'G7'
        when 'Pawn8'
        return 'G8'
      end
    end
  end
end