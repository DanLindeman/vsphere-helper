require 'rbvmomi'

def find_vm(name)
  name = name.first
  connection = connect
  data_center = connection.serviceInstance.find_datacenter
  vms_found = recursive_find_vm(data_center.vmFolder,name)
  vms_found.each { |vm| puts vm.name }
end

def recursive_find_vm(folder, name)
  found = []
  folder.children.each do |child|
    if matches(child, name)
      found << child
    elsif child.class == RbVmomi::VIM::Folder
      found << recursive_find_vm(child,name)
    end
  end

  found.flatten
end

def matches(child, name)
  is_vm = child.class == RbVmomi::VIM::VirtualMachine
  name_matches = ((name == "*") || (child.name.include? name))
  return is_vm && name_matches
end
