require 'rbvmomi'

def find_vm(name, exact = false)
  name = name.first if name.kind_of?(Array)
  connection = connect
  data_center = connection.serviceInstance.find_datacenter
  vms_found = recursive_find_vm(data_center.vmFolder, name, exact)
  vms_found.each { |vm| puts vm.name }
end

def recursive_find_vm(folder, name, exact = false)
  found = []
  folder.children.each do |child|
    if matches(child, name, exact)
      found << child
    elsif child.class == RbVmomi::VIM::Folder
      found << recursive_find_vm(child, name, exact)
    end
  end

  found.flatten
end

def matches(child, name, exact = false)
  is_vm = child.class == RbVmomi::VIM::VirtualMachine
  name_matches = (name == "*") || (exact ? (child.name == name) : (child.name.include? name))
  return is_vm && name_matches
end
