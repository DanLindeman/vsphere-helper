def handle(command, arguments)
  puts command
  case command
  when "listVM"
    listVM arguments
  end
end

def listVM(arguments)
  arguments.each { |argument| puts argument }
end
