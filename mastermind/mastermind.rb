class Game

  def initialize
    ## use for testing
    #@answer = %w( R B G R )

    ## generate the mastermind answer
    @answer = []
    4.times do
      @answer << MASTERMIND_COLORS.sample
    end

    ## set the feedback
    @feedback = '----'
  end

  def display(guess)
    puts "TURN:\t\t #{$turns}"
    puts
    puts "ANSWER:\t\t #{@answer.join}"
    puts "GUESS:\t\t #{guess.join}"
    puts "FEEDBACK:\t #{@feedback}"
  end

  def check_winner(guess)

    ## check straight away, you never know
    if guess == @answer
      @feedback = 'XXXX'
      return true
    end

    ## lets loop around the guess and change the feedback
    guess.each_with_index do |g, i|
      ## start with the correct color in the correct position
      if g == @answer[i]
        @feedback[i] = 'X'
      end

      ## check that color is correct but in wrong position
      if (@answer.include? g) && (@feedback[i] != 'X')
          @feedback[i] = 'O'
      end
    end
    return false
  end

  def get_answer
    @answer.join
  end

end

## the colurs that are used Red, Blue, Green and Yellow
MASTERMIND_COLORS = ['R', 'B', 'G', 'Y']

play = true
$turns = 1

while play

  game = Game.new

  ## lets make sure the user input is correct
  check_input = true
  while check_input
    puts "What is your Guess (use only R,B,G,Y values): "
    guess = gets.chomp.split('')

    # lets make sure the user enters only RGBY combinations
    if (guess - MASTERMIND_COLORS).length > 0
      puts "You must enter only R,B,G,Y combinations"
    else
      check_input = false
    end
  end

  ## check to see if the user is a winner
  if game.check_winner(guess)
    game.display(guess)
    puts "\nYou have won!!!!"
    play = false
  else
    game.display(guess)
  end

  ## after 12 turns end the game if not guessed by then
  if ($turns == 3) && (play == true)
    puts "\nYou have had you 12 turns, sorry better luck next time (answer: #{game.get_answer})"
    play = false
  else
    $turns += 1
  end
end