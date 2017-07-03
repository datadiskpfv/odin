class Knight
  attr_accessor :location, :moves, :prev_move

  def initialize(coords, prev_move=nil)
    @location = coords
    all_moves(coords)
    @prev_move = prev_move
  end

  def all_moves(destination)
    @moves = [[(destination[0] + 2), (destination[1] + 1)],
              [(destination[0] + 2), (destination[1] - 1)],
              [(destination[0] - 2), (destination[1] + 1)],
              [(destination[0] - 2), (destination[1] - 1)],
              [(destination[0] + 1), (destination[1] + 2)],
              [(destination[0] + 1), (destination[1] - 2)],
              [(destination[0] - 1), (destination[1] + 2)],
              [(destination[0] - 1), (destination[1] - 1)]]

    #puts "MOVES (before): #{@moves}"

    @moves.reject! do |cell|
      cell.any? { |x| x < 0 } || cell.any? { |x| x > 7 }
    end
    return moves
  end

end