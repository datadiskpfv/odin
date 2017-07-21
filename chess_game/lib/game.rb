require_relative 'player'
require_relative 'board'
require_relative 'King'
require_relative 'Queen'
require_relative 'Rook'
require_relative 'Knight'
require_relative 'Bishop'
require_relative 'Pawn'

class Game

  def initialize
    #puts 'Enter the first players name who will be white: '
    #name = gets.chomp
    #@player1 = Player.new(name, 'White')
    @player1 = Player.new('Paul', 'White')

    #puts 'Enter the second players name who will be black: '
    #name = gets.chomp
    #@player2 = Player.new(name, 'Black')
    @player2 = Player.new('Lorraine', 'Black')

    @board = Board.new
    setup_board
    @board.display_board(@player1, @player2)
  end

  def start
    #play = true
    #while(play)
      #welcome()
      #puts "Player 1 turn: "
      #move = gets.chomp
      from = 'B8'
      to = 'D8'
      @board.move_piece(from, to)
    @board.display_board(@player1, @player2)
    #end
  end

  def setup_board
    @player1.pieces.each do |k,v|
      @board.add_piece(v, v.startup)
    end

    @player2.pieces.each do |k,v|
      @board.add_piece(v, v.startup)
    end
  end

  def welcome
    puts "Welcome #{@player1.name} (#{@player1.color}) and #{@player2.name} (#{@player2.color})"
    puts "Lets play chess ....rules"
  end
end

game = Game.new
game.start