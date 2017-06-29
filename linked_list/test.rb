require './linked_list.rb'

list = LinkedList.new

list.append(1)
list.append(2)
list.append(3)
p list.to_s

list.prepend(100)
p list.to_s

puts "SIZE: #{list.size}"

puts list.head.value
puts list.tail.value

p list.at(2).value

p list.pop.value
p list.tail.value

puts "================"
list.append(4)
list.append(5)
p list.to_s

puts "================"
puts "Contains 5: #{list.contains?(5)}"

puts "================"
puts "The value at index 3 is #{list.at(3).value}"
puts "Find 4: find at index #{list.find?(4)}"

p list.at(0).value
p list.at(4).value

puts "================"
p list.pop.value
p list.to_s
