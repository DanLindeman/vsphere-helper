require 'rbvmomi'

$snap_num = 0

def delete(name, number)
  name = name.first if name.kind_of?(Array)
  number =~ /\A\d+\Z/ or die "#{number} is not an integer."
  number = number.to_i
  connection = connect
  data_center = connection.serviceInstance.find_datacenter
  vm = recursive_find_vm(data_center.vmFolder, name, true).first or die("No vm found with name matching <#{name}>.")
  top_level_snapshots = vm.snapshot.rootSnapshotList or die("The given vm has no snapshots.")
  snapshot_to_delete = find_snapshot(top_level_snapshots, number) or die "No snapshot found with number <#{number}>."

  if yes_or_no_prompt("Are you sure you want to delete snapshot <#{snapshot_to_delete.name}>? ", false)
    snapshot_to_delete.snapshot.RemoveSnapshot_Task(:removeChildren => false).wait_for_completion
    puts "Snapshot deleted."
  end
end

def find_snapshot(top_level_snapshots, number)
  snapshot_to_delete = nil
  top_level_snapshots.each do |top_level_snapshot|
    result = recursive_find_snapshot(top_level_snapshot, number)
    if !result.nil?
      snapshot_to_delete = result
      break
    end
  end
  snapshot_to_delete
end

def recursive_find_snapshot(snapshot, number)
  return snapshot if $snap_num ==  number
  $snap_num += 1
  children = snapshot.childSnapshotList
  children.each do |child|
    snapshot_to_delete = recursive_find_snapshot(child, number)
    return snapshot_to_delete unless snapshot_to_delete.nil?
  end
  return nil
end

