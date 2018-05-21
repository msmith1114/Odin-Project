dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(words,dict)
 dictHash = {}
 dict.each {|dict|
   dictHash[dict] = words.downcase.scan(/#{dict}/).count if words.downcase.scan(/#{dict}/).count > 0
 }
 dictHash
end

puts substrings("below", dictionary)
puts substrings("Howdy partner, sit down! How's it going?", dictionary)
