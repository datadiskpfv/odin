class Chess_Piece

  attr_accessor :name, :color, :image

  def get_coords_array(coords)
    v, h = coords.split('')
    h = h.to_i - 1
    v = v.ord - 65
    return [v,h]
  end

end