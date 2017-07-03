require './board.rb'
require './knight.rb'

#knight = Knight.new('Knight')
#game = Board.new

#game.initial_place_piece(knight, [4,4])
#game.display_board

#current_location = [0,0]

#[[3,6],[5,7], [6,5], [7,5], [5,3]].each do |user_choice|
#  if knight.moves(current_location).include?(user_choice)
#    puts "Move legal #{user_choice}"
#    game.place_piece(knight, user_choice, current_location)
#    current_location = user_choice
#  else
#    puts "Move illegal"
#  end
#end

#game.display_board

#puts "Where has the knight been?"
#p knight.get_trail

#destination = [4,3]
destination = [6,7]
start = [0,0]
checked = []
queue = []
route = []

knight = Knight.new(start)
turns = 0

until knight.location == destination
  knight.moves.each do |move|
    puts "Checking #{move}"
    unless checked.include?(move)
      queue << Knight.new(move, knight)
      checked << move
      puts "checked: #{checked}"
    end
  end
  knight = queue.shift
  turns += 1
end
puts "Found destination #{destination}"
puts "Checked: #{checked}"

route << knight.location
puts "route1: #{route}"
until knight.prev_move.nil?
  route << knight.prev_move.location
  knight = knight.prev_move
  puts "route: #{route}"
end

puts "Your route is #{route.reverse.each { |move| move } }."
puts "You got there in #{turns} turns."
