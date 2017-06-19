def bubble_sort_by(a1)
  p a1
  a1.length.times do
    (a1.length-1).times do |index|
      if (yield a1[index], a1[index+1]) > 0
        a1[index], a1[index+1] = a1[index+1], a1[index]
      end
    end
  end
  p a1
end


bubble_sort_by(["hi","h","hello", "happy", "hey"]) do |left,right|
  left.length - right.length
end

# => ["hi", "hey", "hello", "happy"]