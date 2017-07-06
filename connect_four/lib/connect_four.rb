class Connect_four

  attr_accessor :board, :column, :message, :player1, :player2, :player, :win

  def initialize
    cols = 7
    rows = 6
    @board = Array.new

    cols.times do
      @board << Array.new(rows) {nil}
    end

    message = ''
    win = false
  end

  def display
    puts "   1     2     3     4     5     6     7"
    puts "-------------------------------------------"
    puts "|%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |" % [@board[5][0], @board[5][1], @board[5][2], @board[5][3], @board[5][4], @board[5][5], @board[5][6]]
    puts "-------------------------------------------"
    puts "|%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |" % [@board[4][0], @board[4][1], @board[4][2], @board[4][3], @board[4][4], @board[4][5], @board[4][6]]
    puts "-------------------------------------------"
    puts "|%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |" % [@board[3][0], @board[3][1], @board[3][2], @board[3][3], @board[3][4], @board[3][5], @board[3][6]]
    puts "-------------------------------------------"
    puts "|%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |" % [@board[2][0], @board[2][1], @board[2][2], @board[2][3], @board[2][4], @board[2][5], @board[2][6]]
    puts "-------------------------------------------"
    puts "|%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |" % [@board[1][0], @board[1][1], @board[1][2], @board[1][3], @board[1][4], @board[1][5], @board[1][6]]
    puts "-------------------------------------------"
    puts "|%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |%3s  |" % [@board[0][0], @board[0][1], @board[0][2], @board[0][3], @board[0][4], @board[0][5], @board[0][6]]
    puts "-------------------------------------------"
    puts "#{@message}"
    @message = ''
  end

  def player_move_check
    @column = ''
    until @column =~ /^[{1,2,3,4,5,6,7}]$/
      puts "#{@player.name} enter select a column (1-7) or q to Quit: "
      @column = gets.chomp

      if @column == 'q'
        exit 0
      end
    end
  end

  def add_token
     @board.each_with_index do |s, i|

       if @board[5][@column.to_i - 1] != nil
         @message = "Column #{@column} is full, Enter another column"
         return false
       end

       if s[@column.to_i - 1].nil?
        s[@column.to_i - 1] = @player.symbol
        check_win
        return true
       end

     end
  end

  def switch_player
    @player = @player == @player1 ? @player2 : @player1
  end

  def check_horizontal(col,row)
    if col < 4 #checks for horizontal line (---) that are 4
      #puts "[#{col}][#{row }] = #{@board[col][row]}"
      #puts "[#{col}][#{row + 1}] = #{@board[col][row + 1]}"
      #puts "[#{col}][#{row + 2}] = #{@board[col][row + 2]}"
      #puts "[#{col}][#{row + 3}] = #{@board[col][row + 3]}"

      if [@board[col][row],@board[col][row + 1],@board[col][row + 2],@board[col][row + 3]].all? {|s| s == @player.symbol}
        @win = true
      end
    end
  end

  def check_win
    7.times do |col|
      6.times do |row|
        check_horizontal(col,row)

        if @win
          @message = "#{@player.name } wins"
          display
          exit 0
        end
      end
    end

    #puts "checking if a win - Column #{@column}  Index: #{index}"

    #puts "[#{index}][#{@column.to_i - 1}] = #{@board[index][@column.to_i - 1]}"
    #puts "[#{index}][#{@column.to_i - 2}] = #{@board[index][@column.to_i - 2]}"
    #puts "[#{index}][#{@column.to_i - 3}] = #{@board[index][@column.to_i - 3]}"
    #puts "[#{index}][#{@column.to_i - 4}] = #{@board[index][@column.to_i - 4]}"



  end
end