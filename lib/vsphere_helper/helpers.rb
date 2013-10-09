def die(msg)
  puts msg
  exit
end

def two_digit_format(num)
  num < 10 ? str = "0" + num.to_s : str = num.to_s
  str
end
