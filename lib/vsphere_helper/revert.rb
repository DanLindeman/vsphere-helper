require 'rbvmomi'

def revert(name)
  name = name.first if name.kind_of?(Array)
  connection = connect
  data_center = connection.serviceInstance.find_datacenter
  vm = recursive_find_vm(data_center.vmFolder, name, true).first or die("No vm found with name matching <#{name}>")
  if yes_or_no_prompt("Are you sure you want to revert <#{name}>?")
    vm.RevertToCurrentSnapshot_Task.wait_for_completion
    puts "Reverted <#{name}>."
  end
end
