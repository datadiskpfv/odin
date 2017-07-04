class GSquare
  attr_accessor :location, :piece

  def initialize(p)
    @piece = nil if p == nil
    @piece = p if p != nil
  end

  def get_image
    return @piece.image
  end

  def get_name
    return @piece.name
  end
end

class Knight
  attr_accessor :color, :image, :location, :name

  def initialize(color, name)
    if color == 'white'
      @image = "\u2658".encode('utf-8')
    else
      @image = "\u265E".encode('utf-8')
    end
    @name = name
  end
end

#white_king_image = "\u2654"
#w_king = white_king_image.encode('utf-8')

#row = ''
#puts "-----------"
#2.times do
#  row << "| #{w_king} "
#end
#puts "| #{w_king} | #{w_king} |"
#puts "-----------"

#puts row + "|"

w_knight1 = Knight.new('black', 'w_knight1')


@board = Hash.new

('a'..'h').each do |letter|
  (1..7).each do |number|
    @board["#{letter}#{number}".to_sym] = GSquare.new(w_knight1)
  end
end

p @board

p @board[:a1]

puts "#{@board[:a1].get_image} #{@board[:a1].get_name}"
puts "#{@board[:b3].get_image} #{@board[:b3].get_name}"
