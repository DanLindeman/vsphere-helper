vsphere-helper
==============

A ruby command-line utility for basic VMware vSphere management using [RbVmomi](https://github.com/rlane/rbvmomi).

Usage
=====

**vSphere information**

list vms for current vSphere host

```list_vms ```

find a particular vm on current vSphere host

```find_vm [vm name]```

**virtual machine information**

get the power status

```status [vm dns name]```

list snapshots

```list_snapshots [vm dns name]```

get the IP address

```get_ip  [vm dns name]```

**virtual machine actions**

power on a vm

```power_on [vm dns name]```

power off a vm

```power_off [vm dns name]```

take snapshot

```snapshot [vm dns name] [title] [details]```

revert to most recent snapshot

```revert [vm dns name]```

goto to particular snapshot

```goto [vm dns name] [snapshot #]```

delete a particular snapshot

```delete [vm dns name] [snapshot #]```
