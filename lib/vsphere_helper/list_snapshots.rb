require 'rbvmomi'

def list_snapshots(name)
  name = name.first
  connection = connect
  data_center = connection.serviceInstance.find_datacenter
  vms_found = recursive_find_vm(data_center.vmFolder,name)
  return if vms_found.nil?
  vms_found.each do |vm|
    puts
    puts "#{vm.name}:"
    (top_level_snapshots = vm.snapshot.rootSnapshotList) unless vm.nil? || vm.snapshot.nil?
    if top_level_snapshots.nil?
      puts "No snapshots."
    else
      top_level_snapshots.each do |top_level_snapshot|
        recursive_list_snapshots(top_level_snapshot, 1)
      end
    end
  end
end

def recursive_list_snapshots(snapshot, level)
  tabs = ""
  level.times { tabs = tabs + "\t" }
  puts "#{tabs}#{snapshot.name}"
  children = snapshot.childSnapshotList
  children.each { |child| recursive_list_snapshots(child, level + 1) }
end
