## The different combinations that you can win
WINNING_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], #Horizontal
                        [0, 3, 6], [1, 4, 7], [2, 5, 8], #Vertical
                        [0, 4, 8], [2, 4, 6]] #Diagonal

## create the board with 8 elements
@board = Array.new(8)

## change the indexes below to test each winning combination
@board[2] = 'X'
@board[4] = 'X'
@board[6] = 'X'

# set the player to be X
player = 'X'

# First we loop through each arry inside the WINNING_COMBINATIONS array
#
# Then we loop through each individual array checking each element on the board to see if that
# element matches the player
#
# a winning combination will return true
p WINNING_COMBINATIONS.any? { |line| p line; line.all? { |square| puts square; @board[square] == player } }