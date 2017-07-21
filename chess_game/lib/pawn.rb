require_relative 'chess_piece'

class Pawn < Chess_Piece
  def initialize(color, name)
    @name = name
    @color = color
    @image = color == 'White' ? "\u2659" : "\u265F"
    @start_position = true
    @jump = false	
  end

  def all_moves(from_coords)
    destination = get_coords_array(from_coords)
    puts "Desination: #{destination}"

    @moves = [[(destination[0] + 1), (destination[1])],
              [(destination[0] + 2), (destination[1])],
              [(destination[0] + 1), (destination[1] - 1)],
              [(destination[0] + 1), (destination[1] + 1)]]

    puts "MOVES (before): #{@moves}"

    @moves.reject! do |cell|
      cell.any? { |x| x < 0 } || cell.any? { |x| x > 7 }
    end
    puts "MOVES (after): #{@moves}"
    return @moves
  end

  def attack_move(from_coords)
	## [[row-1, column+1], [row-1, column-1]]
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