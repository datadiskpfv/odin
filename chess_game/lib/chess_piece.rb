class Chess_Piece

  attr_accessor :name, :color, :image, :first_move, :moves

  def get_coords_array(coords)
    v, h = coords.split('')
    h = h.to_i - 1
    v = v.ord - 65
    return [v,h]
  end

  def north_moves(from_coords, board, moves)
    destination = get_coords_array(from_coords)
    puts "From: #{destination}"

    n = 1
    while destination[0] + n < 8
      if board[destination[0] + n][destination[1]].contains.nil?
        moves << [(destination[0] + n), (destination[1])]
        n += 1
      elsif board[destination[0] + n][destination[1]].contains.color != @color
        moves << [(destination[0] + n), (destination[1])]
        n = 8
      else
        break
      end
    end
  end

  def east_moves(from_coords, board, moves)
    destination = get_coords_array(from_coords)
    puts "From: #{destination}"

    n = 1
    while destination[1] + n < 8
      if board[destination[0]][destination[1] + n].contains.nil?
        moves << [(destination[0]), (destination[1] + n)]
        n += 1
      elsif board[destination[0]][destination[1] + n].contains.color != @color
        moves << [(destination[0]), (destination[1] + n)]
        n = 8
      else
        break
      end
    end
  end

  def west_moves(from_coords, board, moves)
    destination = get_coords_array(from_coords)
    puts "From: #{destination}"

    n = 1
    while destination[1] - n >= 0
      if board[destination[0]][destination[1] - n].contains.nil?
        moves << [(destination[0]), (destination[1] - n)]
        n += 1
      elsif board[destination[0]][destination[1] - n].contains.color != @color
        moves << [(destination[0]), (destination[1] - n)]
        n = 8
      else
        break
      end
    end
  end

  def south_moves(from_coords, board, moves)
    destination = get_coords_array(from_coords)
    puts "From: #{destination}"

    n = 1
    while destination[0] - n >= 0
      if board[destination[0] - n][destination[1]].contains.nil?
        moves << [(destination[0] - n), (destination[1])]
        n += 1
      elsif board[destination[0] - n][destination[1]].contains.color != @color
        moves << [(destination[0] - n), (destination[1])]
        n = 8
      else
        break
      end
    end
  end

end