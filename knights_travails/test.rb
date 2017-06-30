a1 = [[0,0], [0,1], [1,0]]
a2 = [0,1]

#p a1
#puts a1.include? a2


def delete_me(array, term)
  array.delete_if { |x| x == term }
end

p a1
p a2
delete_me(a1, a2)

puts "==================================="
p a1
