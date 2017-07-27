require_relative 'player'
require_relative 'board'
require_relative 'King'
require_relative 'Queen'
require_relative 'Rook'
require_relative 'Knight'
require_relative 'Bishop'
require_relative 'Pawn'

class Game

  attr_accessor :player, :oplayer

  def initialize
    #puts 'Enter the first players name who will be white: '
    #name = gets.chomp
    #@player1 = Player.new(name, 'White')
    @player1 = Player.new('Paul', 'White')

    #puts 'Enter the second players name who will be black: '
    #name = gets.chomp
    #@player2 = Player.new(name, 'Black')
    @player2 = Player.new('Lorraine', 'Black')

    @player = @player1
    @oplayer = @player2

    @board = Board.new
    setup_board
    #@board.display_board(@player1, @player2)
  end

  def start
    play = true
    while(play)
      welcome()
      @board.display_board(@player1, @player2)

      result = true
      move = ''

      while result
        puts "Enter your move #{@player.name} (A1-A8)-(H1-H8):  "
        move = gets.chomp

        if move =~ /[A-H][1-8]-[A-H][1-8]/

          pos1, pos2 = move.split(/-/)
          if pos1 == pos2
            puts "The same positions were used, try again"
          else
            #puts "Move ok"
            result = false
          end
        else
          puts "Move Bad, try again"
        end
      end
      result = true
      from, to = move.split('-')

      while !@board.move_piece(from, to, @player, @oplayer)
        @board.display_board(@player1, @player2)


        while result
          puts "Enter your move #{@player.name} (A1-A8)-(H1-H8):  "
          move = gets.chomp

          if move =~ /[A-H][1-8]-[A-H][1-8]/

            pos1, pos2 = move.split(/-/)
            if pos1 == pos2
              puts "The same positions were used, try again"
            else
              #puts "Move ok"
              result = false
            end
          else
            puts "Move Bad, try again"
          end
        end
        result = true
        from, to = move.split('-')
      end

      if @player.pieces.length == 0
        puts "#{@player.name} has no more pieces"
        return @player.name
      elsif @board.winner == true
        puts "board winner is true"
        return @player.name
      end
      if @player.color == 'White'
        @player = @player2
        @oplayer = @player1
      else
        @player = @player1
        @oplayer = @player2
      end

    end
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
winner = game.start
puts "Congratulations #{winner} you have WON!!!!!!"