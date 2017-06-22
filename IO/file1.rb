## create a blank file, then close it
f = File.new 'sample.txt', 'w'
f.close

## there are lots of file methods such as:
##
## size, mtime, rename, exists?, etc, etc

## write to a file (one liner)
File.open("sample2.txt", "w"){ |somefile| somefile.puts "Hello file!"}

## different ways to write to a file (puts, write, <<)
File.open('sample3.txt', 'w') do |f|
  f.puts "Ruby"
  f.write "Java\n"
  f << "Python\n"
end

## read from a file (one liner)
puts File.open("sample3.txt", "r"){ |file| file.read }
puts "------------------------"

## readlines() reads in the whole file (into an array) at once and splits it by line. (be careful using large files)
## readline() reads one line character at a time,

## readlines example
File.open("test.txt").readlines.each do |line|
  puts line
end

puts "------------------------"
## readline example
file = File.open("test.txt", 'r')
while !file.eof?
  line = file.readline
  puts line
end

## you can test for directories the same way (use DIR class)
puts "------------------------"
if File.exists?("test.txt")
  puts "test.txt exists"
end
puts "------------------------"

## use the DIR class for directories, there are lots of methods
##
## mkdir, exists?, pwd, chdir, etc, etc

# count the files in my current directory:
puts Dir.glob('*').length
puts "------------------------"

# list just ruby files
puts Dir.glob('*.{RB,rb}').join(", ")
puts "------------------------"

## get home directory
puts Dir.home
puts "------------------------"

## to run external operating system commands
system 'cd'
puts $?                   ## like $? in unix, returns the status

puts `cd`
puts %x[cd]

puts (open("|cd")).read   ## using file and pipe