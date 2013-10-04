project_root = File.dirname(File.absolute_path(__FILE__))
Dir.glob(project_root + '/*') {|file| require file}

def zero_argument_commands
  [
    'list_vms'
  ]
end

def one_argument_commands
  [ 
    'find_vm', 'status', 'list_snapshots', 'get_ip',
    'power_on', 'power_off', 'revert'
  ]
end

def two_argument_commands
  [ 
    'goto', 'delete'
  ]
end

def three_argument_commands
  [
    'snapshot'
  ]
end

def valid_commands
  zero_argument_commands + one_argument_commands + two_argument_commands + three_argument_commands
end

def handle(command, arguments)
  if valid_commands.include? command
    if correct_number_of_arguments(command, arguments.length)
      send(command, arguments)
    else
      send("#{command}_usage")
    end
  else
    usage
  end
end

def correct_number_of_arguments(command, length)
  case command
  when 'list_vms'
    return true
  when 'find_vm', 'status', 'list_snapshots', 'get_ip'
    return length == 1
  when 'power_on', 'power_off', 'revert'
    return length == 1
  when 'goto', 'delete'
    return length == 2
  when 'snapshot'
    return length == 3
  end
end
