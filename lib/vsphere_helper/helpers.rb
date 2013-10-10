def die(msg)
  puts msg
  exit
end

def two_digit_format(num)
  num < 10 ? str = "0" + num.to_s : str = num.to_s
  str
end

def yes_or_no_prompt(text, default = true)
  response = ''
  default_response = default ? 'y' : 'n'
  until %w[Y y yes Yes N n no No].include? response
    response = prompt text
    response = default_response if response.length == 0
  end
  %w[y Y yes Yes].include? response
end

def prompt(text)
  puts text
  $stdin.gets.chomp
end
