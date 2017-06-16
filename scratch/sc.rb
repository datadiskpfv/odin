
def substrings(words, dic = {})
  #puts words
  p dic
  results = Hash.new(0)

  words.split(' ').each do |word|
    dic.each do |w|
      if word.downcase.include?(w) == true
        #puts "Found: #{w}"
        results[w] = results[w] + 1
      end
    end
  end

  printf("#{results.sort}")
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

substrings("below", dictionary)
# {"below"=>1, "low"=>1}

substrings("below down", dictionary)
puts

substrings("Howdy partner, sit down! How's it going?", dictionary)

