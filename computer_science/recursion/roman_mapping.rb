roman_mapping = {
    1000 => "M",
    900 => "CM",
    500 => "D",
    400 => "CD",
    100 => "C",
    90 => "XC",
    50 => "L",
    40 => "XL",
    10 => "X",
    9 => "IX",
    5 => "V",
    4 => "IV",
    1 => "I"
}

roman_mapping2 = {
    "M" => 1000,
    "CM" => 900,
    "D" => 500,
    "CD" => 400,
    "C" => 100,
    "XC" => 90,
    "L" => 50,
    "XL" => 40,
    "X" => 10,
    "IX" => 9,
    "V" => 5,
    "IV" => 4,
    "I" => 1
}

def integer_to_roman(roman_mapping, number, result = '')
  return result if number == 0
  roman_mapping.keys.each do |divisor|
    quotient, modulus = number.divmod(divisor)
    puts "Quotient: #{quotient}    Modulus: #{modulus}   Divisor: #{divisor} Result: #{result}"
    result << roman_mapping[divisor] * quotient
    return integer_to_roman(roman_mapping, modulus, result) if quotient > 0
  end
end

puts integer_to_roman(roman_mapping, 2014)

puts
puts "================================"
puts
## divmod will return an array with the divided number (quotient) and the remainder (modulus)
## [3, 3], 3 times and 3 remainder
p 15.divmod(4)
def roman_to_integer(roman_mapping2, str, result = 0)
  return result if str.empty?
  roman_mapping2.keys.each do |roman|
    if str.start_with?(roman)
      result += roman_mapping2[roman]
      str = str.slice(roman.length, str.length)
      puts "STR: #{str}   Roman: #{roman}   Result: #{result}"
      return roman_to_integer(roman_mapping2, str, result)
    end
  end
end
puts
puts "================================"
puts roman_to_integer(roman_mapping2, 'MMXIV')