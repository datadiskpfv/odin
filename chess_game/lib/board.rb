require_relative 'square'

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
    puts " H |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |" % [square('H1'), square('H2'), square('H3'), square('H4'), square('H5'), square('H6'), square('H7'), square('H8')]
    puts "   -------------------------------------------------"
    puts " G |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |" % [square('G1'), square('G2'), square('G3'), square('G4'), square('G5'), square('G6'), square('G7'), square('G8')]
    puts "   -------------------------------------------------"
    puts " F |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |" % [square('F1'), square('F2'), square('F3'), square('F4'), square('F5'), square('F6'), square('F7'), square('F8')]
    puts "   -------------------------------------------------"
    puts " E |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |" % [square('E1'), square('E2'), square('E3'), square('E4'), square('E5'), square('E6'), square('E7'), square('E8')]
    puts "   -------------------------------------------------"
    puts " D |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |" % [square('D1'), square('D2'), square('D3'), square('D4'), square('D5'), square('D6'), square('D7'), square('D8')]
    puts "   -------------------------------------------------"
    puts " C |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |" % [square('C1'), square('C2'), square('C3'), square('C4'), square('C5'), square('C6'), square('C7'), square('C8')]
    puts "   -------------------------------------------------"
    puts " B |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |%3s |" % [square('B1'), square('B2'), square('B3'), square('B4'), square('B5'), square('B6'), square('B7'), square('B8')]
    puts "   -------------------------------------------------"
    puts " A |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |%3s |" % [square('A1'), square('A2'), square('A3'), square('A4'), square('A5'), square('A6'), square('A7'), square('A8')]
    puts "   -------------------------------------------------"
    puts "#{@message}"
    @message = ''
  end

  def add_piece(piece, coords)

    v, h = convert_coords(coords)

    square = board[v][h]
    square.contains = piece

    return "board: [#{v}][#{h}]"

  end

  def convert_coords(coords)
    v, h = coords.split('')
    h = h.to_i - 1
    v = v.ord - 65

    return v,h
  end

  def move_piece(from, to)

  end

  def square(coords)
    v, h = convert_coords(coords)

    if (@board[v][h].contains.nil?)
      return @board[v][h].contains
    else
      @board[v][h].contains.image
    end
  end
end