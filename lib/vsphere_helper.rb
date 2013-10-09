require 'vsphere_helper/handler.rb'
class VsphereHelper
  def self.execute_vsphere_helper_command(argv)
    if argv.length == 0
      puts "Usage: vsphere_helper [command] [argument(s)]"
    else
      command = argv.shift
      puts "vspherehelper: #{argv.length}"
      handle(command, argv)
    end
  end
end
