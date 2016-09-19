def palindrome?(str)
  sentance = str.gsub(/(\W)/i, "") # replaces all non-word chars with ""
  reversed_sentance = sentance.reverse # reverses the string
  if sentance.casecmp(reversed_sentance) == 0
    true
  else
    false
  end
end

def count_words(str)
  new_string = str.gsub(/[^\w\s]/i, "").downcase # replaces non-word chars excluding spaces with "" and downcases the string
  words_array = new_string.split # creates an array of the modified string
  counts = Hash.new 0 # initializes a hash obj
  words_array.each do |word| # iterates over the words array and updates the hash object with the num of occurrences of each word
    counts[word] += 1
  end
  counts
end