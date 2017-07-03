class Knight
  attr_accessor :location, :moves, :previous

  def initialize(coordinates, previous=nil)
    @location = coordinates
    possible_moves(coordinates)
    @previous = previous
  end

  def possible_moves(destination)
    @moves = [[(destination[0] + 2), (destination[1] + 1)],
              [(destination[0] + 2), (destination[1] - 1)],
              [(destination[0] - 2), (destination[1] + 1)],
              [(destination[0] - 2), (destination[1] - 1)],
              [(destination[0] + 1), (destination[1] + 2)],
              [(destination[0] + 1), (destination[1] - 2)],
              [(destination[0] - 1), (destination[1] + 2)],
              [(destination[0] - 1), (destination[1] - 1)]]

    @moves.reject! do |cell|
      cell.any? { |x| x < 0 } || cell.any? { |x| x > 7 }
    end
    return moves
  end

end