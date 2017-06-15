
def substrings(words, dic = {})
  puts words
  p dic

  words.split(' ').each do |word|
    dic.each do |w|
      if word.include?(w) == true
        puts "Found: #{w}"
      end
    end
  end
end


dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

substrings("below", dictionary)
# {"below"=>1, "low"=>1}
puts

substrings("below down", dictionary)
puts

substrings("Howdy partner, sit down! How's it going?", dictionary)

