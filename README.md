vsphere-helper
==============

A ruby command-line utility for basic VMware vSphere management using [RbVmomi](https://github.com/rlane/rbvmomi).

Usage
=====

**vSphere actions**

list vms for current vSphere host

```listVM ```

find a particular vm on current vSphere host

```findVM [vm name]```

**virtual machine actions**

power on a vm

```powerOn [vm dns name]```

power off a vm

```powerOff [vm dns name]```

take snapshot

```snapshot [vm dns name] [title] [details]```

revert to most recent snapshot

```revert [vm dns name]```

goto to particular snapshot

```goto [vm dns name] [snapshot #]```

delete a particular snapshot

```delete [vm dns name] [snapshot #]```

**virtual machine information**

get the power status

```status [vm dns name]```

list snapshots

```listSnapshots [vm dns name]```

get the IP address

```getIP  [vm dns name]```
