require 'rbvmomi'

def find_vm(name, exact = false)
  name = name.first if name.kind_of?(Array)
  connection = connect
  data_center = connection.serviceInstance.find_datacenter
  vms_found = recursive_find_vm(data_center.vmFolder, name, exact)
  (vms_found.length > 0) ? (vms_found.each { |vm| puts vm.name }) : (puts "No vm found with name matching <#{name}>.")
end
