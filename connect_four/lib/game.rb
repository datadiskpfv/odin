require './connect_four.rb'
require './player.rb'

game = Connect_four.new

print "Enter Player 1 name: "
player1 = Player.new(gets.chomp)

print "Enter Player 2 name: "
player2 = Player.new(gets.chomp)

puts "Welcome #{player1.name} and #{player2.name}"

game.display