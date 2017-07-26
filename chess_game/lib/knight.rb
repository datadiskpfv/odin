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
    #puts "From: #{destination}"

    #@moves = [[(destination[0] + 2), (destination[1] + 1)],
    #          [(destination[0] + 2), (destination[1] - 1)],
    #          [(destination[0] - 2), (destination[1] + 1)],
    #          [(destination[0] - 2), (destination[1] - 1)],
    #          [(destination[0] + 1), (destination[1] + 2)],
    #          [(destination[0] + 1), (destination[1] - 2)],
    #          [(destination[0] - 1), (destination[1] + 2)],
    #          [(destination[0] - 1), (destination[1] - 1)]]

    @moves = []

    if destination[0] + 2 < 8 && destination[1] + 1 < 8
      @moves << [(destination[0] + 2), (destination[1] + 1)] if board[destination[0] + 2][destination[1] + 1].contains.nil? || board[destination[0] + 2][destination[1] + 1].contains.color != @color
    end

    if destination[0] + 2 < 8 && destination[1] - 1 >= 0
      @moves << [(destination[0] + 2), (destination[1] - 1)] if board[destination[0] + 2][destination[1] - 1].contains.nil? || board[destination[0] + 2][destination[1] - 1].contains.color != @color
    end

    if destination[0] - 2 >= 0 && destination[1] + 1 < 8
      @moves << [(destination[0] - 2), (destination[1] + 1)] if board[destination[0] - 2][destination[1] + 1].contains.nil? || board[destination[0] - 2][destination[1] + 1].contains.color != @color
    end

    if destination[0] - 2 >= 0 && destination[1] - 1 >= 0
      @moves << [(destination[0] - 2), (destination[1] - 1)] if board[destination[0] - 2][destination[1] - 1].contains.nil? || board[destination[0] - 2][destination[1] - 1].contains.color != @color
    end

    if destination[0] + 1 < 8 && destination[1] + 2 < 8
      @moves << [(destination[0] + 1), (destination[1] + 2)] if board[destination[0] + 1][destination[1] + 2].contains.nil? || board[destination[0] + 1][destination[1] + 2].contains.color != @color
    end

    if destination[0] + 1 < 8 && destination[1] - 2 >= 0
      @moves << [(destination[0] + 1), (destination[1] - 2)] if board[destination[0] + 1][destination[1] - 2].contains.nil? || board[destination[0] + 1][destination[1] - 2].contains.color != @color
    end

    if destination[0] - 1 >= 0 && destination[1] + 2 < 8
      @moves << [(destination[0] - 1), (destination[1] + 2)] if board[destination[0] - 1][destination[1] + 2].contains.nil? || board[destination[0] - 1][destination[1] + 2].contains.color != @color
    end

    if destination[0] - 1 >= 0 && destination[1] - 1 >= 0
      @moves << [(destination[0] - 1), (destination[1] - 1)] if board[destination[0] - 1][destination[1] - 1].contains.nil? || board[destination[0] - 1][destination[1] - 1].contains.color != @color
    end
    #puts "MOVES (before): #{@moves}"

    @moves.reject! do |cell|
      cell.any? { |x| x < 0 } || cell.any? { |x| x > 7 }
    end
    #puts "MOVES (after): #{@moves}"
    return @moves
  end
end