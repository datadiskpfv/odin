require_relative 'square'

class Board
  attr_accessor :board, :message

  def initialize
    cols = 8
    rows = 8
    @board = Array.new

    cols.times do
      @board << Array.new(rows) {Square.new}
    end
  end

  def display_board(player1, player2)
    puts "      1     2     3     4     5     6     7     8 "
    puts "   -----------------------------------------------"
    puts " H | %2s | %2s | %2s | %2s | %2s | %2s | %2s | %2s |" % [square('H1'), square('H2'), square('H3'), square('H4'), square('H5'), square('H6'), square('H7'), square('H8')]
    puts "   -----------------------------------------------"
    puts " G | %2s | %2s | %2s | %2s | %2s | %2s | %2s | %2s |" % [square('G1'), square('G2'), square('G3'), square('G4'), square('G5'), square('G6'), square('G7'), square('G8')]
    puts "   -----------------------------------------------"
    puts " F | %2s | %2s | %2s | %2s | %2s | %2s | %2s | %2s |" % [square('F1'), square('F2'), square('F3'), square('F4'), square('F5'), square('F6'), square('F7'), square('F8')]
    puts "   -----------------------------------------------"
    puts " E | %2s | %2s | %2s | %2s | %2s | %2s | %2s | %2s |" % [square('E1'), square('E2'), square('E3'), square('E4'), square('E5'), square('E6'), square('E7'), square('E8')]
    puts "   -----------------------------------------------"
    puts " D | %2s | %2s | %2s | %2s | %2s | %2s | %2s | %2s |" % [square('D1'), square('D2'), square('D3'), square('D4'), square('D5'), square('D6'), square('D7'), square('D8')]
    puts "   -----------------------------------------------"
    puts " C | %2s | %2s | %2s | %2s | %2s | %2s | %2s | %2s |" % [square('C1'), square('C2'), square('C3'), square('C4'), square('C5'), square('C6'), square('C7'), square('C8')]
    puts "   -----------------------------------------------"
    puts " B | %2s | %2s | %2s | %2s | %2s | %2s | %2s | %2s |" % [square('B1'), square('B2'), square('B3'), square('B4'), square('B5'), square('B6'), square('B7'), square('B8')]
    puts "   -----------------------------------------------"
    puts " A | %2s | %2s | %2s | %2s | %2s | %2s | %2s | %2s |" % [square('A1'), square('A2'), square('A3'), square('A4'), square('A5'), square('A6'), square('A7'), square('A8')]
    puts "   -----------------------------------------------"
    puts "Player One pieces: #{player1.pieces.length}"
    puts "Player Two pieces: #{player2.pieces.length}\n"
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

  def move_piece(from_coords, to_coords)

  from = from_coords
  to = to_coords
  puts "From: #{from}  To: #{to}"

  from_square = get_square(from_coords)
  to_square = get_square(to_coords)
  to_dest = get_coord_array(to_coords)

  piece = get_piece(from)
  puts "Piece: #{piece.name}"

  if piece.all_moves(from).include? to_dest
    puts "Found a valid move  #{piece.all_moves(from).include? to_dest}"
    piece.all_moves(from).each do |move|
      puts "Comparing #{move} to #{to_dest}"
      if move == to_dest
        puts "Valid Move: #{move}"
        from_square.contains = nil
        to_square.contains = piece
        break
      end
    end
  else
    puts "Not a valid move"
    exit 0
  end

	## get non_attach_moves from_coords (we will need to check nothing in in path)

	## if square is empty move as long as it valid
    ## check that path is clear (if jump is false)
	
	## if square has same color piece illegal move
	
	## get attack_moves from_coords
	## if attack mode would if a different color is on the to_coords
		## check that path is clear to attack (if jump is false)
		## remove player piece	
  end

  def square(coords)
    v, h = convert_coords(coords)

    if (@board[v][h].contains.nil?)
      return "\u2003" #@board[v][h].contains
    else
      @board[v][h].contains.image
    end
  end

  def get_piece(coords)
    v, h = convert_coords(coords)

    if (@board[v][h].contains.nil?)
      return ''
    else
      @board[v][h].contains
    end
  end

  def get_square(coords)
    v, h = convert_coords(coords)
    return @board[v][h]
  end

  def get_coord_array(coords)
    v, h = coords.split('')
    h = h.to_i - 1
    v = v.ord - 65
    return [v,h]
  end
end