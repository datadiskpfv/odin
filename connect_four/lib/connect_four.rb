class Connect_four

  attr_accessor :board

  def initialize
    cols = 7
    rows = 6
    @board = Array.new

    cols.times do
      @board << Array.new(rows) {nil}
    end
  end

  def display
    puts " 1 2 3 4 5 6 7"
    puts "hello"
  end
end