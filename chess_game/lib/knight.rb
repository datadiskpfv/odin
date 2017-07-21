require_relative 'chess_piece'

class Knight <Chess_Piece
  def initialize(color, name)
    @name = name
    @color = color
    @image = color == 'White' ? "\u2658" : "\u265E"
  end

  def startup
    if @color == 'White'
      return @name == 'Knight1' ? 'A2' : 'A7'
    else
      return @name == 'Knight1' ? 'H2' : 'H7'
    end
  end

  def all_moves(from_coords, board)
    destination = get_coords_array(from_coords)
    puts "Desination: #{destination}"

    #@moves = [[(destination[0] + 2), (destination[1] + 1)],
    #          [(destination[0] + 2), (destination[1] - 1)],
    #          [(destination[0] - 2), (destination[1] + 1)],
    #          [(destination[0] - 2), (destination[1] - 1)],
    #          [(destination[0] + 1), (destination[1] + 2)],
    #          [(destination[0] + 1), (destination[1] - 2)],
    #          [(destination[0] - 1), (destination[1] + 2)],
    #          [(destination[0] - 1), (destination[1] - 1)]]

    n = @color == 'White' ? 1 : -1
    @moves = []

    @moves << [(destination[0] + n), (destination[1])] if board[destination[0] + n][destination[1]].contains.nil?

    if board[destination[0] + (n*2)][destination[1]].contains.nil?
      puts "check: #{board[destination[0] + (n*2)][destination[1]].contains.nil?}"
      @moves << [(destination[0] + (n*2)), (destination[1])] if @first_move
    end

    @moves << [(destination[0] + n), (destination[1] - n)] if !board[destination[0] + n][destination[1] - n].contains.nil? && board[destination[0] + n][destination[1] - n].contains.color != @color
    @moves << [(destination[0] + n), (destination[1] + n)] if !board[destination[0] + n][destination[1] + n].contains.nil? && board[destination[0] + n][destination[1] + n].contains.color != @color

    puts "MOVES (before): #{@moves}"

    @moves.reject! do |cell|
      cell.any? { |x| x < 0 } || cell.any? { |x| x > 7 }
    end
    puts "MOVES (after): #{@moves}"
    return @moves
  end
end