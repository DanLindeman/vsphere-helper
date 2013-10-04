require 'rbvmomi'

def list_vms
  connection = connect
  data_center = connection.serviceInstance.find_datacenter
  recursive_list_vms data_center.vmFolder
end

def recursive_list_vms(folder)
  folder.children.each do |child|
    puts child.name if child.class == RbVmomi::VIM::VirtualMachine
    recursive_list_vms child if child.class == RbVmomi::VIM::Folder
  end
end
