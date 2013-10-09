require 'rbvmomi'

def power_on(name)
  name = name.first if name.kind_of?(Array)
  connection = connect
  data_center = connection.serviceInstance.find_datacenter
  vm = recursive_find_vm(data_center.vmFolder, name, true).first or die("No vm found with name matching <#{name}>")
  puts "Powering on #{vm.name}..."
  vm.PowerOnVM_Task.wait_for_completion
  puts "#{vm.name} is now powered on."
end
