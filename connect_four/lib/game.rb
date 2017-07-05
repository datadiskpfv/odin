require './connect_four.rb'
require './player.rb'

game = Connect_four.new

#print "Enter Player 1 name: "
#player1 = Player.new(gets.chomp, 'x')

#print "Enter Player 2 name: "
#player2 = Player.new(gets.chomp, 'o')

#puts "Welcome #{player1.name} and #{player2.name}"

player1 = Player.new('Paul', 'x')
player2 = Player.new('Lorraine', 'o')

game.display

player = player1

while true
  game.player_move_check(player)
  game.add_token(player)
  game.display
  player = player == player1 ? player2 : player1
end