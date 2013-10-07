require 'rbvmomi'

def status(name)
  name = name.first
  connection = connect
  data_center = connection.serviceInstance.find_datacenter
  vms_found = recursive_find_vm(data_center.vmFolder,name)
  vms_found.each { |vm| puts "#{vm.name}: #{vm.summary.runtime.powerState}" }
end

def recursive_find_vm(folder, name)
  found = []
  folder.children.each do |child|
    if ((child.class == RbVmomi::VIM::VirtualMachine) && (child.name.include? name))
      found << child
    elsif child.class == RbVmomi::VIM::Folder
      found << recursive_find_vm(child,name)
    end
  end

  found.flatten
end
