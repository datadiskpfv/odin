class Player
  attr_accessor :name, :color

  def initialize(name, color)
    @name = name
    @color = color
    pieces = %w(King Queen Castle1 Castle2 Knight1 Knight2 Bishop1 Bishop2 Pawn1 Pawn2 Pawn3 Pawn4 Pawn5 Pawn6 Pawn7 Pawn8);
  end
end