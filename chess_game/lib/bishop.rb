require_relative 'chess_piece'

class Bishop < Chess_Piece

  def initialize(color, name)
    @name = name
    @color = color
    @image = color == 'White' ? "\u2657" : "\u265D"
  end

  def startup
    if @color == 'White'
      return @name == 'Bishop1' ? 'A3' : 'A6'
    else
      return @name == 'Bishop1' ? 'H3' : 'H6'
    end
  end

  def all_moves(from_coords, board)
    destination = get_coords_array(from_coords)
    puts "From: #{destination}"

    #@moves = [[(destination[0] + 2), (destination[1] + 1)],
    #          [(destination[0] + 2), (destination[1] - 1)],
    #          [(destination[0] - 2), (destination[1] + 1)],
    #          [(destination[0] - 2), (destination[1] - 1)],
    #          [(destination[0] + 1), (destination[1] + 2)],
    #          [(destination[0] + 1), (destination[1] - 2)],
    #          [(destination[0] - 1), (destination[1] + 2)],
    #          [(destination[0] - 1), (destination[1] - 1)]]

    @moves = []
    puts "Getting North East Moves"
    north_east_moves(from_coords, board, @moves)
    puts "Getting South East Moves"
    south_east_moves(from_coords, board, @moves)
    puts "Getting South West Moves"
    south_west_moves(from_coords, board, @moves)
    puts "Getting South Moves"
    north_west_moves(from_coords, board, @moves)

    puts "MOVES (before): #{@moves}"
    @moves.reject! do |cell|
      cell.any? { |x| x < 0 } || cell.any? { |x| x > 7 }
    end
    puts "MOVES (after): #{@moves}"
    return @moves
  end
end