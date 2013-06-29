vsphere-helper
==============

A ruby command-line utility for basic VMware vSphere management using [RbVmomi](https://github.com/rlane/rbvmomi).

Usage
=====

_vsphere-helper_
* getHost/setHost - get/set current vSphere host
* getPort/setPort - get/set current vSphere port
* getUser/setUser - get/set current vSphere user
* getPass/setPass - get/set current vSphere password

_vSphere actions_
* listVM - list vms
* findVM - find a particular vm

_virtual machine actions_
* power on/off
* take snapshot
* revert to most recent snapshot
* goto to particular snapshot

_virtual machine information_
* power status
* list snapshots
* IP address
