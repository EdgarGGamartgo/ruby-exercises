def substrings(word, dictionary)
    multiple_words = word.split(' ')

    dictionary.reduce({}) do |my_substrings, dictionary_word|
        for mw in multiple_words do
            word_exists = my_substrings.key?(:"#{dictionary_word.downcase}")
            is_substring = mw.downcase.include?(dictionary_word.downcase) 

            if is_substring && !word_exists
                my_substrings.merge!("#{dictionary_word.downcase}": 1)
            elsif is_substring && word_exists
                my_substrings[:"#{dictionary_word.downcase}"] += 1
            end
        end

        my_substrings
    end
end

my_dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

p substrings("below", my_dictionary)
p substrings("Howdy partner, sit down! How's it going?", my_dictionary)