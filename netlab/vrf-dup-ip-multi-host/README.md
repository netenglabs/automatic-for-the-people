This topology tests duplicate IPs across VRFs with hosts spread across multiple hosts with
multipathing between source and dest. It also enables lldp on hosts.

Copy the .j2 files into ~/.netlab before doing `netlab up`. You also need to fix the eos-add-defrt-mgmt to ensure the addresses match what's specific to your laptop if suzieq is running on a different machine than where netlab is running.
