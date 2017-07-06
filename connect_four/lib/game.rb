require './connect_four.rb'
require './player.rb'

game = Connect_four.new

#print "Enter Player 1 name: "
#player1 = Player.new(gets.chomp, 'x')

#print "Enter Player 2 name: "
#player2 = Player.new(gets.chomp, 'o')

#puts "Welcome #{player1.name} and #{player2.name}"

game.player1 = Player.new('Paul', 'x')
game.player2 = Player.new('Lorraine', 'o')
game.player = game.player1

game.display

while true
  game.player_move_check
  game.add_token
  game.display
  game.switch_player
end