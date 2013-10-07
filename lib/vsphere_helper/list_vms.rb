require 'rbvmomi'

def list_vms
  connection = connect
  data_center = connection.serviceInstance.find_datacenter
  all_vms = find_vm("*")
  all_vms.each { |vm| vm.name }
end
