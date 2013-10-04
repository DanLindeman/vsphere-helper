require 'rbvmomi'

def connect
  RbVmomi::VIM.connect host: get_host, user: get_user, password: get_pass, insecure: "true"
end
