# ((((1) + 2) + 3) + 4)
def sum_upto(n)
  return 1 if n == 1
  sum_upto(n-1) + n

  ## one liner
  ## n == 1 ? 1 : sum_upto(n-1) + n
end

puts sum_upto 4

## [5,4,3,2,1,0]
## list all numbers in reserve
def append (arry, n)
  return arry if n < 0
  arry << n                # put before to go up in value
  append(arry, n-1)
end

p append [], 5

## list all numbers in reserve
def reverse_append (arry, n)
  return arry if n < 0
  reverse_append(arry, n-1)
  arry << n                # put after to reverse the order
  arry
end

p reverse_append [], 5


## [0,1,1,2,3,5,8,13,21,34]
##
## n =	0	1	2	3	4	5	6	7	  8	  9	  10	11	12	13	14	...
## xn =	0	1	1	2	3	5	8	13	21	34	55	89	144	233	377	...
def fib(n)
  return n if n == 0
  if n == 1
    puts "1"      ## as we drill only 0ne is return the numbers of times is supposed too
    return n
  end
  fib(n-1) + fib(n-2)

  ## one liner
  #
  ## n < 2 ? n : fib(n-1) + fib(n-2)
end

p fib 8


puts "racecar".split('') == "racecar".split('').reverse