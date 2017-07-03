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

  def place_piece(p, new_coords, prev_coords)
    square_new = @board[new_coords[0]][new_coords[1]]
    square_prev = @board[prev_coords[0]][prev_coords[1]]

    square_new.place p
    square_prev.place nil

    p.add_trail(new_coords)
  end

  def initial_place_piece(p, coords)
    square = @board[coords[0]][coords[1]]
    square.place p
  end

end