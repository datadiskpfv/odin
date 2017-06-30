require './square.rb'

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
    @board.each_with_index do |c, ci|
      c.each_with_index do |r, ri|
        puts "Column: #{ci}  Row: #{ri}  Contents: #{r.contains}"
      end
    end
  end

  def place_piece(p, coords)
    square = @board[coords[0]][coords[1]]
    square.place p
  end

end