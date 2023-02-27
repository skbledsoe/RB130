=begin
given an encrypted string
iterate through characters using inject, empty string as starter
  call decrypt on each char, add to starter
return starter

decrypt method
  given a character
  if character is between a-m,A-M, add 13 to ord of char and convert
  if character is between n-z,N-Z, subtract 13 from ord and convert
  otherwise leave char alone 


=end

ENCRYPTED_NAMES = ['Nqn Ybirynpr', 'Tenpr Ubccre', 'Nqryr Tbyqfgvar', 'Nyna Ghevat',
                   'Puneyrf Onoontr', 'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
                   'Wbua Ngnanfbss', 'Ybvf Unvog', 'Pynhqr Funaaba', 'Fgrir Wbof',
                   'Ovyy Tngrf', 'Gvz Orearef-Yrr', 'Fgrir Jbmavnx', 'Xbaenq Mhfr',
                   'Fve Nagbal Ubner', 'Zneiva Zvafxl', 'Lhxvuveb Zngfhzbgb',
                   'Unllvz Fybavzfxv', 'Tregehqr Oynapu'].freeze

def decrypt_name(string)
  string.chars.inject('') do |result, char|
    result + decrypt_char(char)
  end
end

def decrypt_char(char)
  case char
  when 'a'..'m', 'A'..'M' then (char.ord + 13).chr
  when 'n'..'z', 'N'..'Z' then (char.ord - 13).chr
  else                          char
  end
end

ENCRYPTED_NAMES.each do |name|
  puts decrypt_name(name)
end
