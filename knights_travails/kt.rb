require './board.rb'
require './knight.rb'

knight = Knight.new
game = Board.new

game.place_piece(knight, [0,0])
game.display_board

p game

p knight.moves([0,1])