require 'rbvmomi'

def power_off(name)
  name = name.first if name.kind_of?(Array)
  connection = connect
  data_center = connection.serviceInstance.find_datacenter
  vm = recursive_find_vm(data_center.vmFolder, name, true).first or die("No vm found with name matching <#{name}>")
  puts "Powering off #{vm.name}..."
  vm.PowerOffVM_Task.wait_for_completion
  puts "#{vm.name} is now powered off."
end
