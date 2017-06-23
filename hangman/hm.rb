require './file_utils'

class Game

  include FILE_UTILS

  def initialize
    ## create the array to draw the hangman
    @hangman_array = Array.new(8) {Array.new(8,' ')}

    ## will choice from 5desk.txt file
    #@answer = "banana".split('')
    @answer = generate_answer.split('')

    ## will need to get length of picked word
    #@feedback = "------".split('')
    @feedback = Array.new(@answer.length, '-')
  end

  def generate_answer
    file = File.open("5desk.txt", 'r')

    words = []
    file.each do |l|
      if (l.length >= 5) && (l.length <=12)
        words.push(l)
      end
    end
    return words.sample.downcase.chomp
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
    puts "Letters used: \t#{$guessed_letters.join(', ')}"
    puts "ANSWER: \t#{@answer.join}"
    puts "FEEDBACK: \t#{@feedback.join}"
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

  def save_game
    save = Game_json.new @hangman_array, $turns, @feedback, $guessed_letters, @answer
    p save.to_json
    save_file(save)
  end

  def load_game
    game_json_object = Game_json.from_json(load_file)
    puts game_json_object
    @hangman_array = game_json_object['hangman_array']
    $turns = game_json_object['turns']
    @feedback = game_json_object['feedback']
    $guessed_letters = game_json_object['guessed_letters']
    @answer = game_json_object['answer']
  end

end

class Game_json
  attr_accessor :hangman_array, :turns, :feedback, :guessed_letters, :answer

  def initialize(hangman_array, turns, feedback, guessed_letters, answer)
    @hangman_array = hangman_array
    @turns = turns
    @feedback = feedback
    @guessed_letters = guessed_letters
    @answer = answer
  end

  def to_json
    JSON.dump ({
        :hangman_array => @hangman_array,
        :turns => @turns,
        :feedback => @feedback,
        :guessed_letters => @guessed_letters,
        :answer => @answer
    })
  end

  def self.from_json(string)
    data = JSON.load string
  #  p data
  #  self.new(data['name'], data['age'], data['gender'])
  end
end

## test graphics
#  8.times do |i|
#    game.bad_choice(i + 1)
#  end

##########################
#########  MAIN ##########
##########################
$turns = 0
$guessed_letters = []

play = true
game = Game.new
while play

  game.display

  ## lets make sure the user input is correct
  check_input = true
  while check_input
    puts 'What is your Guess (a-z) or 0 to save/quit or 1 to load previous game: '
    guess = gets.chomp


    # lets make sure the user enters only a single letter a-z
    if (guess !~ /^[a-z,0,1]$/)
        puts "You must enter only single letter a-z"
    elsif (guess == '0') || (guess == '1')
      puts "you have chosen to save or load a game"
      if guess == '0'
        game.save_game
        game.display
      else
        if game.load_game
          puts "you have loaded the previous game"
          game.display
        else
          puts "You dont have a saved game"
        end
      end
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
