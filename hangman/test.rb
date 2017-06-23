file = File.open("5desk.txt", 'r')

p file.size

words = []
file.each do |l|
  if (l.length >= 5) && (l.length <=12)
    words.push(l)
  end
end

answer = words.sample.chomp

answer_length = answer.length

feedback = Array.new(answer_length, '-')

p answer
p feedback

