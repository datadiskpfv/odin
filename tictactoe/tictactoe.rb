class Game

  WINNING_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], #Horizontal
                          [0, 3, 6], [1, 4, 7], [2, 5, 8], #Vertical
                          [0, 4, 8], [2, 4, 6]] #Diagonal

  def initialize
    @board = Array.new(8)
  end

  def display
    ## clear the screen
    puts "\e[H\e[2J"

    puts "    A  |   B  |   C  "
    puts "1   #{@board[0]}   |   #{@board[1]}   |  #{@board[2]}   "
    puts "---------------------"
    puts "2   #{@board[3]}   |   #{@board[4]}   |  #{@board[5]} "
    puts "---------------------"
    puts "3   #{@board[6]}   |   #{@board[7]}   |  #{@board[8]} "
  end

  def add_move(square, player)

    case (square)
      when 'A1' then index = 0
      when 'B1' then index = 1
      when 'C1' then index = 2
      when 'A2' then index = 3
      when 'B2' then index = 4
      when 'C2' then index = 5
      when 'A3' then index = 6
      when 'B3' then index = 7
      when 'C3' then index = 8
    end

    ## make sure the square has not been used
    if @board[index].nil?
      @board[index] = player
      return false
    else
      return true
    end
  end

  def check_winner(player)
    if WINNING_COMBINATIONS.any? { |line| line.all? { |square| @board[square] == player } }
      return true
    end
  end
end

winner = false
player = 'O'
turns = 1

while true
  r1 = ''
  square = ''
  play = true

  ## loop until we get the correct response from the user
  until ['Y', 'N', 'y', 'n'].include? r1 do
    printf("Do you want to play TicTacToe [y|n]: ")
    r1 = gets.chomp.to_s

    case r1
      when 'N', 'n'
        exit
    end
  end

  ## setup the game
  game = Game.new

  ## display the game
  game.display

  ## keep looping until someone wins or its a draw
  while play
    puts

    ## we check for bad input and if the square has already been used
    bad_input = true
    square_taken = true
    r3 = false
    while bad_input
      printf("Player #{player}, select a square A1-C3: ")
      square = gets.chomp.to_s

      if square =~ /(A|B|C)[1-3]/
        bad_input = false
      else
        puts "Wrong data entered"
      end

      if game.add_move(square, player)
        puts "That square #{square} has already been taken, try again"
        bad_input = true
      end
    end

    ## all looks good so display the updated game
    game.display

    ## check for a winner or if its a draw, otherwise repeat the loop
    if game.check_winner(player)
      puts "Player #{player} has WON !!!!!"
      play = false
      turns = 1
      player = 'O'
    else
      ## if no one has won by this point its a draw
      if turns == 9
        puts "its a DRAW!!!!!"
        play = false
        turns = 1
        player = 'O'
      else
        ## switch the player
        player = player == 'X' ? 'O' : 'X'
        turns += 1
      end
    end
  end
end