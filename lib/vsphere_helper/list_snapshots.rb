require 'rbvmomi'

def list_snapshots(name)
  name = name.first if name.kind_of?(Array)
  connection = connect
  data_center = connection.serviceInstance.find_datacenter
  vm = recursive_find_vm(data_center.vmFolder, name, true).first or die("No vm found with name matching <#{name}>.")
  puts "#{vm.name}:"
  top_level_snapshots = vm.snapshot.rootSnapshotList or die("No snapshots.")
  top_level_snapshots.each do |top_level_snapshot|
    recursive_list_snapshots(top_level_snapshot, 1)
  end
end
