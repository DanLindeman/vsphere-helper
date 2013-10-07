require 'rbvmomi'

def status(name)
  name = name.first
  connection = connect
  data_center = connection.serviceInstance.find_datacenter
  vms_found = recursive_find_vm(data_center.vmFolder,name)
  vms_found.each { |vm| puts "#{vm.name}: #{vm.summary.runtime.powerState}" }
end
