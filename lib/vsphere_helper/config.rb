# Environmental variable names
HOST = 'VSPHERE_HOST'
PORT = 'VSPHERE_PORT'
USER = 'VSPHERE_USER'
PASS = 'VSPHERE_PASS'


def set_host(hostname)
  set_variable(HOST, hostname)
end

def get_host
  get_variable(HOST)
end

def prompt_for_host
  get_host.length > 0 ? get_host : prompt_for_variable("vSphere hostname")
end

def set_port(portnum)
  set_variable(PORT, portnum)
end

def get_port
  get_variable(PORT)
end

def prompt_for_port
  get_port.length > 0 ? get_port : prompt_for_variable("vSphere port number")
end

def set_user(username)
  set_variable(USER, username)
end

def get_user
  get_variable(USER)
end

def prompt_for_user
  get_user.length > 0 ? get_user : prompt_for_variable("vSphere username")
end

def set_pass(password)
  set_variable(PASS, password)
end

def get_pass
  get_variable(PASS)
end

def prompt_for_pass
  get_pass.length > 0 ? get_pass : prompt_for_variable("vSphere password")
end

def configure
  set_host prompt_for_host
  set_port prompt_for_port
  set_user prompt_for_user
  set_pass prompt_for_pass
  puts get_host
  puts get_port
  puts get_user
  puts get_pass
end

private
def set_variable(variable_name, variable_value)
  ENV[variable_name] = variable_value
end

def get_variable(variable_name)
  ENV[variable_name] || ""
end

def prompt_for_variable(variable_name)
  value = ""

  while value.length < 1
    print "Please provide the #{variable_name}: "
    STDOUT.flush  
    value = $stdin.gets.chomp
  end

  value
end
