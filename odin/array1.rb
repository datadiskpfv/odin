A = [1, 2, 3, 4, 5]
B = [4, 5, 6, 7, 8]

union = A | B
isect = A & B
diff1  = A - B
diff2  = B - A
sdiff = (A - B) | (B - A)

puts "Union of arrays: #{union}"
puts "Intersection of arrays: #{isect}"
puts "Difference of arrays A - B: #{diff1}"
puts "Difference of arrays B - A: #{diff2}"
puts "Symmetric difference of arrays: #{sdiff}"

nums = [1, 3, 2, 6, 7, 12, 8, 15]

selected = nums.select do |e|
  e > 10
end

puts selected.inspect

collected = nums.collect do |e|
  e > 10
end

puts collected.inspect

mapped = nums.map do |e|
  e*2
end

puts mapped.inspect

eached = nums.each do |e|
  e > 10
end

puts eached.inspect