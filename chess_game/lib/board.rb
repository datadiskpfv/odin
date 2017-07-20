require './square'

class Board
  attr_accessor :board

  def initialize
    cols = 8
    rows = 8
    @board = Array.new

    cols.times do
      @board << Array.new(rows) {Square.new}
    end
  end

  def display_board
    puts "      1     2     3     4     5     6     7     8   "
    puts "   -------------------------------------------------"
    puts " H |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |" % [square(7,0), square(7,1), @board[7][2], @board[7][3], @board[7][4], @board[7][5], @board[7][6], @board[7][7], @board[7][8]]
    puts "   -------------------------------------------------"
    puts " G |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |" % [@board[6][0], @board[6][1], @board[6][2], @board[6][3], @board[6][4], @board[6][5], @board[6][6], @board[6][7], @board[6][8]]
    puts "   -------------------------------------------------"
    puts " F |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |" % [@board[5][0], @board[5][1], @board[5][2], @board[5][3], @board[5][4], @board[5][5], @board[5][6], @board[5][7], @board[5][8]]
    puts "   -------------------------------------------------"
    puts " E |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |" % [@board[4][0], @board[4][1], @board[4][2], @board[4][3], @board[4][4], @board[4][5], @board[4][6], @board[4][7], @board[4][8]]
    puts "   -------------------------------------------------"
    puts " D |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |" % [@board[3][0], @board[3][1], @board[3][2], @board[3][3], @board[3][4], @board[3][5], @board[3][6], @board[3][7], @board[3][8]]
    puts "   -------------------------------------------------"
    puts " C |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |" % [@board[2][0], @board[2][1], @board[2][2], @board[2][3], @board[2][4], @board[2][5], @board[2][6], @board[2][7], @board[2][8]]
    puts "   -------------------------------------------------"
    puts " B |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |" % [@board[1][0], @board[1][1], @board[1][2], @board[1][3], @board[1][4], @board[1][5], @board[1][6], @board[1][7], @board[1][8]]
    puts "   -------------------------------------------------"
    puts " A |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |" % [@board[0][0], @board[0][1], @board[0][2], @board[0][3], @board[0][4], @board[0][5], @board[0][6], @board[0][7], @board[0][8]]
    puts "   -------------------------------------------------"
    puts "#{@message}"
    @message = ''
  end

  def add_piece(piece, coords)
    square = board[7][1]
    square.contains = piece
  end

  def square(h,v)
    #@board[h][v].contains.name
    if (@board[h][v].contains.nil?)
      return @board[h][v].contains
    else
      @board[h][v].contains.image
    end
  end
end