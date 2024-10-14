This setup is a copy of Ivan's vrf route leaking topo except that all links are p2p. 

You can start the topology with a device of your choice using: "netlab up -s defaults.device=<nos>".
For example, start iosxe with this topo using netlab up -s defaults.device=csr.

You can look for success by pinging 10.0.0.5 from cr1 or 10.0.0.3 from cb1. You can run
"netlab validate" to verify the successful leak as well.
