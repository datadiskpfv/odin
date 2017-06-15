def stock_picker(stocks = {})

  total = final_x = final_y = 0

  stocks.each_with_index do |x, i|
    stocks[i+1..-1].each do |y|
      t = y - x
      if t > total
        total = t; final_x = x; final_y = y
      end
    end
  end

  puts "Total: #{total}  (#{final_y} - #{final_x})"

end

test_values = [17,3,6,9,15,8,6,1,10]
puts "#{stock_picker(test_values)}"
test_values = [19,17,2,6,20,1,1]
puts "#{stock_picker(test_values)}"
test_values = [23,2,7,17,19,2,2,2,7,1]
puts "#{stock_picker(test_values)}"
test_values = [9,7,6,5,4,3,2,1]
puts "#{stock_picker(test_values)}"
test_values = [1,2,3,4,5,6,7,8,9]
puts "#{stock_picker(test_values)}"
