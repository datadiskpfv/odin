family = %w{ paul lorraine dominic jessica }

results = family.all? do |word|
  word[0] == "p"
end

p "Result: #{results}"