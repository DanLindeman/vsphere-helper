require 'rbvmomi'

def snapshot(name, title, details)
  name = name.first if name.kind_of?(Array)
  connection = connect
  data_center = connection.serviceInstance.find_datacenter
  (vm = recursive_find_vm(data_center.vmFolder, name, true).first) or die("No vm found with name matching <#{name}>.")
  puts "Creating <#{name}> snapshot <#{title}> with description <#{details}>..."
  vm.CreateSnapshot_Task(:name => title, :description => details, :memory => false, :quiesce => false)
  puts "Snapshot created."
end
