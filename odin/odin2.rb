def fibo(n)
  n <= 2 ? 1 : fibo(n-1) + fibo(n-2)
end

total = (1..15).map{|x| fibo(x)}

total.each do |i|
  if( (i % 2) == 0 )
    puts i
  end
end