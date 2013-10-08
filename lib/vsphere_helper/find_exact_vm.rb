require 'rbvmomi'

def find_exact_vm(name)
  find_vm(name, true)
end
