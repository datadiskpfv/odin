class Player
  attr_accessor :name, :color, :pieces

  def initialize(name, color)
    @name = name
    @color = color

    @pieces = {'King'   => King.new(color),
              'Queen'   => Queen.new(color),
              'Rook1'   => Rook.new(color, 'Rook1'),
              'Rook2'   => Rook.new(color, 'Rook2'),
              'Knight1' => Knight.new(color, 'Knight1'),
              'Knight2' => Knight.new(color, 'Knight2'),
              'Bishop1' => Bishop.new(color, 'Bishop1'),
              'Bishop2' => Bishop.new(color, 'Bishop2'),
              'Pawn1'   => Pawn.new(color, 'Pawn1'),
              'Pawn2'   => Pawn.new(color, 'Pawn2'),
              #'Pawn3'   => Pawn.new(color, 'Pawn3'),
              #'Pawn4'   => Pawn.new(color, 'Pawn4'),
              #'Pawn5'   => Pawn.new(color, 'Pawn5'),
              'Pawn6'   => Pawn.new(color, 'Pawn6'),
              'Pawn7'   => Pawn.new(color, 'Pawn7'),
              'Pawn8'   => Pawn.new(color, 'Pawn8')}
  end
end