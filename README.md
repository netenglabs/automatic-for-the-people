# automatic-for-the-people
This repository is to help build a collection of valuable snippets for users to try out various multi-vendor configurations in the context of different topologies and technologies. 

The first provided configuration and Vagrantfile is for deploying multi-vendor EVPN in a 2 tier Clos topology. You should be able to dynamically change the number of leaves, spines, exit leaves and specify which NOS you wish to use for a given layer. See the README in the specific topology directory.

The Vagrant boxes used in the simulation include:

| Vagrant Box                       | Version     |
|-----------------------------------|-------------|
| CumulusCommunity/cumulus-vx       | > 3.7.9, <=4.2 |
| cisco/nxosv                       | 9.3.4       |
| arista/veos                       | 4.23.5M     |
| Juniper/vqfx10k                   | 0.4.0       |
| generic/ubuntu1804                | latest      |


## Software Used

| Software          | Version |
|-------------------|---------|
|[Vagrant](https://www.vagrantup.com/)| 2.2.7|
|[vagrant-libvirt](https://github.com/vagrant-libvirt/vagrant-libvirt)|
|[Ansible](https://www.ansible.com/)| 2.9.5/2.9.9 |
|[FRRouting](https://frrouting.org/)| 7.2 & version in Cumulus 4.2 |

## Spinning up The Simulations

If you're new to Vagrant, install [vagrant](https://releases.hashicorp.com/vagrant/) 2.2.7 (2.2.10 has problems with some of the VMs), and then run ```vagrant up``` in the 2t-clos-single-attach or 2t-clos-dual-attach directories. After the simulation has spun up, you can run ansible-playbook deploy-evpn.yml. It uses ospf-ibgp with ingress replication as the default setup. Junos is not supported in the dual-attach mode as it doesn't support MLAG, and I'm yet to add EVPN multi-homing support. To spin up the other NOSes, you'll need to get them imagess from the vendors and convert them to support varant libvirt if you want to use them with Vagrant. Brad Searle has written up good instructions for doing this on his [blog](https://codingpackets.com/blog/tag/libvirt/). Marc Weisel has some more automated support in his [github repos](https://github.com/mweisel?tab=repositories). NXOS has some teething troubles on startup (takes a very long time), but is fine once its up.

The vagrant-libvirt link contains instructions on installing libvirt, QEMU and KVM for various Linux distributions. I use libvirt because it spins up VMs in parallel, making the entire setup a breeze on most modern You can use other simulation environments such as EVE-NG and GNS3 if you wish to spin up the simulations and use the configuration files here. Please send PRs if you'd like to contribute GNS3/EVE-NG or Virtualbox-based Vagrant configs. The basic model I follow for connecting the nodes is:
* Spines connect to all leaves first, leaf01 on port 1, leaf02 on port 2 etc, and then connect to the exit leaves
* Leaves connect to the spines first (spine01 on port 1, ..) and then connect to the servers (server101...), before connecting to each other for MLAG/VPC peer-link (dual attach case only)
* The Exit leaves connect to the spines first before connecting to the firewall and connect to the DC edge router last (port 4 in default config with 2 spines and 1 firewall)

The device configs should be agnostic to the simulation model used. I do assume the following groups and group variables are defined to enable the playbooks to work
* groups: spine, leaf, exit, dcedge, firewall, servers
* group_vars: _ansible_network_os_ for each of the layers. I do use "cumulus" as the ansible_network_os for Cumulus switches even though Cumulus doesn't use network_cli.

Here's an example of what the Vagrantfile produces as the ansible inventory:
```[all:children]
leaf
spine
exit
servers
firewall
dcedge

[leaf:vars]
ansible_network_os=nxos

[spine:vars]
ansible_network_os=cumulus

[exit:vars]
ansible_network_os=eos

[dcedge:vars]
ansible_network_os=junos
````


