require './player'
require './board'
require './King'

class Game

  def initialize
    #puts 'Enter the first players name who will be white: '
    #name = gets.chomp
    #@player1 = Player.new(name, 'white')

    #puts 'Enter the second players name who will be black: '
    #name = gets.chomp
    #@player2 = Player.new(name, 'white')

    board = Board.new


    pieces = {'King' => nil}
    pieces['King'] = King.new('White')

    #puts "King: #{pieces['King'].name}"

    board.add_piece(pieces['King'], '00')
    board.display_board
  end

  def start
    #welcome()
  end

  def welcome
    puts "Welcome #{@player1.name} (#{@player1.color}) and #{@player2.name} (#{@player2.color})"
    puts "Lets play chess ....rules"
  end
end

game = Game.new
game.start