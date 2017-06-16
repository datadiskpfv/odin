def substrings(words, dic = {})
  results = Hash.new
  words.downcase!

  dic.each do |w|
    count = words.scan(/#{w}/).length
    results[w.to_sym] = count unless count.zero?
  end

  p results.sort
end

## Another way to do the above

#def substrings(string, array)
#  array.inject(Hash.new(0)) {|hash, key|
#    hash[key] += string.downcase.scan(key).length if string.downcase.scan(key).length.nonzero?
#    hash
#  }
#end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

substrings("below", dictionary)
# {"below"=>1, "low"=>1}
substrings("below down", dictionary)
substrings("Howdy partner, sit down! How's it going?", dictionary)