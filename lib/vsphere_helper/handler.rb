Dir["./*.rb"].each {|file| require file }

def valid_commands
  [
    'list_vms', 'find_vm', 'status', 'list_snapshots', 'get_ip',
    'power_on', 'power_off', 'revert', 'goto', 'delete', 'snapshot'
  ]
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
