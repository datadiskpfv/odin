class Board

  def initialize
    @grid = Array.new(3) { Array.new(3, 0) }
  end

  def display
    p @grid
  end

  def add_move
  end

  def check_winner
  end
end

play = true
winner = false

while (play == true)
  r1 = ''

  ## clear the screen
  #puts "\e[H\e[2J"

  ## loop until we get the correct response from the user
  until ['Y', 'N', 'y', 'n'].include? r1 do
    printf("Do you want to play TicTacToe [y|n]: ")
    r1 = gets.chomp.to_s

    case r1
      when 'N', 'n'
        exit
    end
  end

  board = Board.new
  board.display

end