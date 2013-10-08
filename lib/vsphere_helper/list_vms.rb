require 'rbvmomi'

def list_vms
  connection = connect
  data_center = connection.serviceInstance.find_datacenter
  find_vm("*")
end
