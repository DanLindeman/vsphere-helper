require 'rbvmomi'

def status(name)
  name = name.first
  connection = connect
  data_center = connection.serviceInstance.find_datacenter
  vm= recursive_find_vm(data_center.vmFolder, name, true).first or die("No vm found with name matching <#{name}>")
  puts "#{vm.name}: #{vm.summary.runtime.powerState}"
end
