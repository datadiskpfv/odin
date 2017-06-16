def bubble_sort(a1)
  p a1
  a1.length.times do |index|
    (a1.length-1).times do |index|
      while a1[index] > a1[index+1]
          a1[index], a1[index+1] = a1[index+1], a1[index]
      end
    end
  end
  p a1
end

bubble_sort([4,3,78,2,0,2])
puts
bubble_sort([4,3,77,102,5,78,2,0,2])
# => [0,2,2,3,4,78]