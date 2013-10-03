require './vhelprc.rb' 
# Environmental variable names
HOST = 'VSPHERE_HOST'
PORT = 'VSPHERE_PORT'
USER = 'VSPHERE_USER'
PASS = 'VSPHERE_PASS'

def set_host(hostname)
  set_variable(HOST, hostname)
end

def get_host()
  get_variable(HOST)
end

def set_port(portnum)
  set_variable(PORT, portnum)
end

def get_port()
  get_variable(PORT)
end

def set_user(username)
  set_variable(USER, username)
end

def get_user()
  get_variable(USER)
end

def set_pass(password)
  set_variable(PASS, encrypted_password)
end

def get_pass()
  get_variable(PASS)
end

private
def set_variable(variable_name, variable_value)
  ENV[variable_name] = variable_value
end

def get_variable(variable_name)
  ENV[variable_name] || ""
end
