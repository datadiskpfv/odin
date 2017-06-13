total = 0;

1.upto(999) do |i|
  if ( (i % 3) == 0 || (i % 5) == 0)
    puts i
    total += i
  end
end

puts "Total: #{total}"