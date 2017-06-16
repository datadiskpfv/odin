def substrings(words, dic = {})
  results = Hash.new
  words.downcase!

  dic.each do |w|
    substring_occurrences = words.scan(/#{w}/).length
    results[w.to_sym] = substring_occurrences unless substring_occurrences.zero?
  end

  p results.sort
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

substrings("below", dictionary)
# {"below"=>1, "low"=>1}
substrings("below down", dictionary)
substrings("Howdy partner, sit down! How's it going?", dictionary)