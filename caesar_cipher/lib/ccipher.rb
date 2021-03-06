class CCipher
def self.caesar_cipher(str, factor)
  result = ''
  #puts "\nString: #{str}   Factor: #{factor}"

  str.each_char do |c|
    char_num = c.ord

    if char_num < 66 || char_num > 122
      # Special character
      #printf "#{c}"
      result << c
      next
    end

    if (65..90).include?(char_num)
      # Upper case leters
      char_num += factor
      char_num = char_num > 90 ? char_num - 26 : char_num
      #printf"#{char_num.chr}"
      result << char_num.chr
      next
    elsif (97..122).include?(char_num)
      # Lower case letter
       char_num += factor
       char_num = char_num > 122 ? char_num - 26 : char_num
      #printf"#{char_num.chr}"
       result << char_num.chr
      next
    end
  end
  return result
end
end

#CCipher.caesar_cipher("What a stringZ!", 5)
## Bmfy f xywnslE!

#CCipher.caesar_cipher("What a stringZ!", 8)
## Epib i abzqvoH!

#CCipher.caesar_cipher("What a stringZ!", 12)
## Itmf m efduzsL!