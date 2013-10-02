require './vhelprc.rb' 

def set_host(hostname)
  set_variable('host', hostname)
end

def get_host()
  get_variable('host')
end

def set_port(portnum)
  set_variable('port', portnum)
end

def get_port()
  get_variable('port')
end

def set_user(username)
  set_variable('user', username)
end

def get_user()
  get_variable('user')
end

def set_pass(password)
  set_variable('pass', password)
end

def get_pass()
  get_variable('pass')
end

private
def set_variable(variable_name, variable_value)
  vhelprc_create() if !vhelprc_exists?()
  if vhelprc_exists?()
    vhelprctemp_create()
    if vhelprctemp_exists?()
      File.open(vhelprc_path()).each_line do |line|
        if !line.include?(variable_name)
          open(vhelprctemp_path(), 'a') { |f| f.puts line }
        end
      end
      open(vhelprctemp_path(), 'a') { |f| f.puts "#{variable_name}=#{variable_value}" }
    end
    File.rename(vhelprctemp_path(), vhelprc_path())
  end
end

def get_variable(variable_name)
  if vhelprc_exists?()
    File.open(vhelprc_path()).each_line do |line|
      if line.include?(variable_name)
        puts line.split(/=/)[1]
        return
      end
    end
    puts "#{variable_name} not found in .vhelprc"
  else
    puts ".vhelprc not found in HOME"
  end
end
