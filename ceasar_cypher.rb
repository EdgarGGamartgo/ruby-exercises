
def caesar_cipher(message, shift_factor)
    alphabet = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']
    other_symbols = ['!', '¡', ',', '.', '?', '¿', ';', ':', '#', '$', '&', '=']
    message.split('').map do |letter|
        idx = alphabet.find_index(letter.upcase)

        if other_symbols.include?(letter)
            letter
        elsif idx == nil
            ' '
        else
            new_letter_idx = idx + shift_factor
            last_alphabet_letter_idx = alphabet.length() - 1
            real_letter = nil

            if new_letter_idx > last_alphabet_letter_idx
                real_letter = alphabet[new_letter_idx - last_alphabet_letter_idx - 1]
            elsif new_letter_idx == last_alphabet_letter_idx
                real_letter = alphabet[last_alphabet_letter_idx]
            else
                real_letter = alphabet[new_letter_idx]
            end

            if letter == letter.downcase
                real_letter.downcase
            else
                real_letter
            end
        end
    end.join()
end

p caesar_cipher("What a string!", 5)