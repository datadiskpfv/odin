
## get the file descriptor number
p IO.sysopen 'test.txt'

## enter the obtained file descriptor number below
lorem = IO.new(3)

## now use gets to get the lines in the file
puts "---------------------"
p lorem.gets
p lorem.pos   # number of characters in line plus /c/r (or /n/r)
p lorem.gets
p lorem.pos
p lorem.gets
p lorem.pos
p lorem.gets
p lorem.pos
p lorem.gets
p lorem.pos
p lorem.gets
p lorem.pos
p "End of file: #{lorem.eof?}"
puts "Lets start again by using rewind"
lorem.rewind
p "Position is #{lorem.pos}"
p lorem.gets

puts "----------------------------------"
p "Lets write to the file"
fd = IO.sysopen('test1.txt', 'a')
io = IO.new(fd, 'a')
p io.puts 'Hello World'
p io.rewind

p IO.sysopen 'test.txt'
io = IO.new(5)
p io.gets
