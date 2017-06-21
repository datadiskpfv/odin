
#puts "Enter: "
#guess = gets.chomp.split('')
#p guess

#a1 = guess
#a2 = ['R', 'B', 'G', 'Y']

#p !((a1 - a2).length > 0)
MASTERMIND_COLORS = ['R', 'B', 'G', 'Y']

@answer = []
4.times do
  @answer << MASTERMIND_COLORS.sample
end

p @answer