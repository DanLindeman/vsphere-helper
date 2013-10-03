def usage
  puts "Usage: vsphere_helper <command> [argument(s)]"
  puts "Valid commands: #{valid_commands.join(" ")}"
end

def single_vm_usage(command)
  puts "Usage: vsphere_helper #{command} <vm name>"
end

def snapshot_action_usage(command)
  puts "Usage: vsphere_helper #{command} <vm name> <snapshot #>"
end

def list_vms_usage
  puts "Usage: vsphere_helper list_vms"
end

def find_vm_usage
  single_vm_usage "find_vm"
end

def status_usage
  single_vm_usage "status"
end

def list_snapshots_usage
  single_vm_usage "list_snapshots"
end

def get_ip_usage
  single_vm_usage "get_ip"
end

def power_on_usage
  single_vm_usage "power_on"
end

def power_off_usage
  single_vm_usage "power_off"
end

def revert_usage
  single_vm_usage "revert"
end

def goto_usage
  snapshot_action_usage "goto"
end

def delete_usage
  snapshot_action_usage "delete"
end

def snapshot_usage
  puts "Usage: vsphere_helper snapshot <vm name> <title> <details>"
end
