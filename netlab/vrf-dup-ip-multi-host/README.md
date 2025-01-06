This topology:
*  tests duplicate IPs across VRFs with hosts spread across multiple
   hosts with multipathing between source and dest. 
* does route leaking betweeen green and red VRFs.
* enables lldp on hosts.

You need to run ansible-playbook cls-enable-netd.yml to ensure that
vagrant user has access to all the commands
