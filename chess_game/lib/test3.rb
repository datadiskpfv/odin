result = true
move = ''
while result
  puts "Enter your move (A1-A8)-(H1-H8):  "
  move = gets.chomp

  if move =~ /[A-H][1-8]-[A-H][1-8]/

    pos1, pos2 = move.split(/-/)
    if pos1 == pos2
      puts "The same positions were used, try again"
    else
      puts "Move ok"
      result = false
    end
  else
    puts "Move Bad, try again"
  end
end

puts "Valid input #{move}"