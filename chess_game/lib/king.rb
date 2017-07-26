require_relative 'chess_piece'

class King < Chess_Piece

  def initialize(color)
    @name = 'King'
    @color = color
    @image = color == 'White' ? "\u2654" : "\u265A"
    @position = []
  end

  def startup
    return @color == 'White' ? 'A5' : 'H5'
  end

  def all_moves(from_coords, board)
    destination = get_coords_array(from_coords)
    #puts "Desination: #{destination}"

    n = 1
    @moves = []

    if destination[0] + n < 8
      @moves << [(destination[0] + n), (destination[1])] if board[destination[0] + n][destination[1]].contains.nil? || board[destination[0] + n][destination[1]].contains.color != @color
    end

    if destination[0] + n < 8 && destination[1] + n < 8
      @moves << [(destination[0] + n), (destination[1] + n)] if board[destination[0] + n][destination[1] + n].contains.nil? || board[destination[0] + n][destination[1] + n].contains.color != @color
    end

    if destination[1] + n < 8
      @moves << [(destination[0]), (destination[1] + n)] if board[destination[0]][destination[1] + n].contains.nil? || board[destination[0]][destination[1] + n].contains.color != @color
    end

    if destination[0] - n >= 0 && destination[1] + n < 8
      @moves << [(destination[0] - n), (destination[1] + n)] if board[destination[0] - n][destination[1] + n].contains.nil? || board[destination[0] - n][destination[1] + n].contains.color != @color
    end

    if destination[0] - n >= 0
      @moves << [(destination[0] - n), (destination[1])] if board[destination[0] - n][destination[1]].contains.nil? || board[destination[0] - n][destination[1]].contains.color != @color
    end

    if destination[0] - n >= 0 && destination[1] - n >= 0
      @moves << [(destination[0] - n), (destination[1] - n)] if board[destination[0] - n][destination[1] - n].contains.nil? || board[destination[0] - n][destination[1] - n].contains.color != @color
    end

    if destination[1] - n >= 0
      @moves << [(destination[0]), (destination[1] - n)] if board[destination[0]][destination[1] - n].contains.nil? || board[destination[0]][destination[1] - n].contains.color != @color
    end

    if destination[0] + n < 8 && destination[1] - n >= 0
      @moves << [(destination[0] + n), (destination[1] - n)] if board[destination[0] + n][destination[1] - n].contains.nil? || board[destination[0] + n][destination[1] - n].contains.color != @color
    end

    #puts "MOVES (before): #{@moves}"

    @moves.reject! do |cell|
      cell.any? { |x| x < 0 } || cell.any? { |x| x > 7 }
    end
    #puts "MOVES (after): #{@moves}"
    return @moves
  end
end