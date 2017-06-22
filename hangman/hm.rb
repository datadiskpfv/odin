class Game

  def initialize
    ## create the array to draw the hangman
    @hangman_array = Array.new(8) {Array.new(8,' ')}

    ## will choice from 5desk.txt file
    @answer = "banana".split('')

    ## will need to get legth of picked word
    @feedback = "------".split('')
  end

  ## bad_choice will draw the hangman into the array
  def bad_choice(count)
    case (count)
      when 1
        6.times do |i|
          @hangman_array[7][i] = '-'
        end
      when 2
        6.times do |i|
          @hangman_array[i + 1][0] = '|'
        end
      when 3
        6.times do |i|
          @hangman_array[0][i] = '-'
        end
      when 4
        @hangman_array[1][5] = '|'
      when 5
        @hangman_array[2][5] = 'O'
      when 6
        @hangman_array[3][4] = '/'
        @hangman_array[3][5] = '|'
        @hangman_array[3][6] = '\\'
      when 7
        @hangman_array[4][5] = '|'
      when 8
        @hangman_array[5][4] = '/'
        @hangman_array[5][6] = '\\'
    end
    display
  end

  def display

    ## clear the screen
    puts "\e[H\e[2J"

    # show the multi-array
    @hangman_array.each do |row|
      puts row.join('')
    end

    puts
    puts "TURNS LEFT: \t#{8 - $turns}"
    puts
    puts "Letters used: \t#{$guessed_letters}"
    puts "ANSWER: \t#{@answer}"
    puts "FEEDBACK: \t#{@feedback}"
    puts
  end

  def check_answer(g)
    found = false
    @answer.each_with_index do |l, i|
      if l == g
        @feedback[i] = g
        found = true
      end
    end
    return found
  end

  def get_answer
    @answer
  end

  def get_feedback
    @feedback
  end

end

$turns = 0
$guessed_letters = []

play = true
## test graphics
#  8.times do |i|
#    game.bad_choice(i + 1)
#  end

game = Game.new
while play

  game.display

  ## lets make sure the user input is correct
  check_input = true
  while check_input
    puts "What is your Guess (lower case: a-z): "
    guess = gets.chomp

    # lets make sure the user enters only a single letter a-z
    if (guess !~ /^[a-z]$/)
        puts "You must enter only single letter a-z"
    else
      ## lets see if the letter has already been chosen
      if $guessed_letters.include? guess
        puts "You have already chosen that letter: #{guess}"
      else
        $guessed_letters.push(guess)
        check_input = false
      end
    end
  end

  if game.check_answer(guess)
    game.display

    if game.get_answer == game.get_feedback
      puts "You have won!!!!!"
      play = false
      game = Game.new
    end
  else
    $turns += 1
    game.bad_choice($turns)

    if $turns == 8
      puts "Bad luck you lost, better luck next time"
      exit 0
    end
  end

end
