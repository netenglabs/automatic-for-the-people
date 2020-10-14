This directory embodies the generic 2-tier Clos topology with a configurable number of leaves and spines, and a configurable number of singly attached servers per leaf. A simple version of this topology is as shown in the figure below.

![Single-Attach Topology](./single-attach-topo.png)

The configurable numbers can be specified in the instance_defs.rb file, which looks like this:
```Ruby
NUM_SPINES = 2
NUM_LEAVES = 2
NUM_EXIT_LEAVES = 2
NUM_DCEDGE_RTRS = 1             # Hardcoded
NUM_FIREWALL = 1                # Hardcoded
NUM_SERVERS_PER_LEAF = 2

SPINE_NOS = "eos"
LEAF_NOS = "nxos"
EXIT_NOS = "cumulus"
DCEDGE_NOS = "junos"
FIREWALL_NOS = "ubuntu"         # Using generic/ubuntu1804

# IP address 127.0.0.1 is used by spine node end of ISL
# IP address 127.0.0.2 is used by leaf node end of ISL
# IP address 127.0.0.3 is used by servers
# IP address 127.0.0.4 is used in case of Juniper for its reserved dummy port and
# its also used firewall, edge router
#
# BASE_PORT is used to setup inter-device links using UDP.
# DUMMY_PORT is used to setup the reserved port required by Junos VMs.
BASE_PORT = 10900
DUMMY_PORT = 10800
SERVER_BASE_PORT = BASE_PORT + NUM_SPINES*100
```
This indicates that the topology that will be instantiated is a 2 spine, 2 leaf topology with 2 servers per leaf. Furthermore, the spines will be built using vEOS, the leaves using nxos, the exit leaves using Cumulus and the DC edge router using Junos. 
The specific host_vars and group_vars provided support this simple instance. You can configure more leaves, more spines and more servers, but you'll need to modify the existing values to account for the larger network. For example, if you add 2 more leaves, you'll need to:
* Add additional ISL ports in the group_vars/spine.yml file
* Add a leaf03.yml and leaf04.yml file in host_vars directory with the contents resembling leaf01.yml/leaf02.yml
* Add additional port IP address information if using BGP to roles/cfg-bgp-isl/vars file. Remember to update the port info for all NOS if you wish to test more NOS

If you wish to add more VNIs/VLANs, you can do so by modifying the l2_networks variable in group_vars/all.yml. You can then assign the new VLANs to server-facing ports in the appropriate host_vars/leaf*.yml file. If you want to add additional EVPN tenant VRFs, you can add this to the evpn_l3_info variable in group_vars/all.yml file, and then use associate L2 networks with the new VRF in l2_networks. 

The configuration should automatically work out everything once you add these additional definitions. 

The file deploy-evpn.yml is the main deployment file for deploying symmetric EVPN with distributed anycast gateway. You can pick the overlay and underlay by setting the appropriate values for overlay and underlay variables in group_vars/all.yml.
