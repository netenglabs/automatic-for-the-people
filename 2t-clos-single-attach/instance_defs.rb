NUM_SPINES = 2
NUM_LEAVES = 2
NUM_EXIT_LEAVES = 2
NUM_DCEDGE_RTRS = 1             # Hardcoded
NUM_FIREWALL = 1                # Hardcoded
NUM_SERVERS_PER_LEAF = 2

SPINE_NOS = "cumulus"
LEAF_NOS = "cumulus"
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
