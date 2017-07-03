a1 = [[0,0], [0,1], [1,0]]
a2 = [0,1]

#p a1
#puts a1.include? a2


#def delete_me(array, term)
#  array.delete_if { |x| x == term }
#end

#p a1
#p a2
#delete_me(a1, a2)

#puts "==================================="
#p a1


#moves<< [ (pos[0]   + 1), (pos[1]   + 2) ]

def check_move(check)
  r = check
  puts "R: #{r}"
  (r[0] < 0) || (r[0] > 8) || (r[1] < 0) || (r[1] > 8) ? false : 'true'

end

moves = Array.new
#moves << check_move( [([0,0][0] - 2), ([0,0][1] - 1)] )
#p [ ([0,1][0] + 1), ([0,1][1] + 2)  ]
#p ([4,5][0])

#p moves

#if check_move( [([4,0][0] - 2), ([0,5][1] - 1)] ) { puts }
#p moves

def check
  return false
end

h = check if (check)
p h