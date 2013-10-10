$snap_num = 0

def die(msg)
  puts msg
  exit
end

def two_digit_format(num)
  num < 10 ? str = "0" + num.to_s : str = num.to_s
  str
end

def yes_or_no_prompt(text, default = true)
  response = ''
  default_response = default ? 'y' : 'n'
  until %w[Y y yes Yes N n no No].include? response
    response = prompt text
    response = default_response if response.length == 0
  end
  %w[y Y yes Yes].include? response
end

def prompt(text)
  puts text
  $stdin.gets.chomp
end

def find_snapshot(top_level_snapshots, number)
  snapshot_to_find = nil
  top_level_snapshots.each do |top_level_snapshot|
    result = recursive_find_snapshot(top_level_snapshot, number)
    if !result.nil?
      snapshot_to_find = result
      break
    end
  end
  snapshot_to_find
end

def recursive_find_snapshot(snapshot, number)
  return snapshot if $snap_num ==  number
  $snap_num += 1
  children = snapshot.childSnapshotList
  children.each do |child|
    snapshot_to_find = recursive_find_snapshot(child, number)
    return snapshot_to_find unless snapshot_to_find.nil?
  end
  return nil
end

def recursive_find_vm(folder, name, exact = false)
  found = []
  folder.children.each do |child|
    if matches(child, name, exact)
      found << child
    elsif child.class == RbVmomi::VIM::Folder
      found << recursive_find_vm(child, name, exact)
    end
  end

  found.flatten
end

def matches(child, name, exact = false)
  is_vm = child.class == RbVmomi::VIM::VirtualMachine
  name_matches = (name == "*") || (exact ? (child.name == name) : (child.name.include? name))
  return is_vm && name_matches
end


def recursive_list_snapshots(snapshot, level)
  snapshots = [snapshot]
  dots = ""
  level.times { dots = dots + ".." }
  puts "#{two_digit_format($snap_num)}#{dots}#{snapshot.name}"
  $snap_num += 1
  children = snapshot.childSnapshotList
  children.each { |child| snapshots << recursive_list_snapshots(child, level + 1) }
  snapshots.flatten
end
