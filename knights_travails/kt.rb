require './board.rb'
require './knight.rb'

knight = Knight.new('Knight')
game = Board.new

game.initial_place_piece(knight, [4,4])
game.display_board

#user_choice = [3,6]
current_location = [4,4]

[[3,6],[5,7], [6,5], [7,5], [5,3]].each do |user_choice|
  if knight.moves(current_location).include?(user_choice)
    puts "Move legal #{user_choice}"
    game.place_piece(knight, user_choice, current_location)
    current_location = user_choice
  else
    puts "Move illegal"
  end
end

game.display_board

puts "Where has the knight been?"
p knight.get_trail
