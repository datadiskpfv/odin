class Board

  def initialize
    @grid = Array.new(3) { Array.new(3, " ") }
  end

  def display

    char = 65

    puts "     1 |  2 |  3 "
    @grid.each_with_index do |row, index|

      puts "       |    |   "
      puts "#{(char).chr}   #{row[0]}  | #{row[1]}  | #{row[2] }  "
      puts "       |    |   "

      char += 1

      if index < 2
        puts "    -------------"
      end
    end
  end

  def add_move(square, player)
    puts "Making a move"

    case (square[0].to_s)
      when 'A'
        index = 0;
      when 'B'
        index = 1;
      when 'C'
        index = 2
    end

    if ['X', 'O'].include? @grid[index][square[1].to_i - 1]
      puts "That square #{square} has already been taken, try again"
      return 1
    else
      @grid[index][square[1].to_i - 1] = player
    end


  end

  def check_winner
  end
end

winner = false
player = 'O'
turns = 1

while true
  r1 = ''
  square = ''
  play = true

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

  while play
    puts

    bad_input = true
    while bad_input
      printf("Player #{player}, select a square A1-C3: ")
      square = gets.chomp.to_s

      if square =~ /(A|B|C)[1-3]/
        bad_input = false
      else
        puts "Wrong data entered"
      end
    end

    board.add_move(square, player)
    board.display


    ## if no one has won by this point its a draw
    if turns == 9
      puts "its a DRAW!!!!!"
      play = false
      turns = 0
    else
      turns += 1
    end

    ## switch the player
    if player == 'X'
      player = 'O'
    else
      player = 'X'
    end
  end

end