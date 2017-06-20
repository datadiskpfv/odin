def increase_by(i)
  start = 0
  lambda { start += i }
end

increase = increase_by(3)
start = 453534534 # won't affect anything
p increase.call # 3
p increase.call # 6