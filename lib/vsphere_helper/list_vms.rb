project_root = File.dirname(File.absolute_path(__FILE__))
Dir.glob(project_root + '/*') {|file| require file}

require 'rbvmomi'

def list_vms
  puts get_host
  puts get_user
  puts get_pass
  vim = RbVmomi::VIM.connect host: get_host, user: get_user, password: get_pass, insecure: "true"
  data_center = vim.serviceInstance.find_datacenter

  data_center.vmFolder.childEntity.grep(RbVmomi::VIM::VirtualMachine).find do |x| 
    puts x.name
    # puts x.summary.config.memorySizeMB
    # puts x.summary.config.numCpu
    # puts x.summary.config.numEthernetCards
    # puts x.summary.config.numVirtualDisks
  end
end
