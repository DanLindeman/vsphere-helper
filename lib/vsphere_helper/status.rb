require 'rbvmomi'

def get_ip(name)
  name = name.first if name.kind_of?(Array)
  connection = connect
  data_center = connection.serviceInstance.find_datacenter
  vm= recursive_find_vm(data_center.vmFolder, name, true).first or die("No vm found with name matching <#{name}>")
  puts "#{vm.name}: #{vm.guest.ipAddress}"
end
