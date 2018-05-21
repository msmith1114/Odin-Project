def caesar_cipher(encode_string,shift_amount)
  arr = encode_string.split("")
  puts "#{arr.join}"
  arr.map!{|char|
    if char =~ /[A-Z]/
      ascii = ((char.ord+shift_amount)-65)%26
      ascii +=65
      char = ascii.chr
    elsif char =~ /[a-z]/
      ascii = ((char.ord+shift_amount)-97)%26
      ascii +=97
      char = ascii.chr
    else
      char = char
  end
  }
  arr.join("")
end

puts caesar_cipher("hello there",6)
