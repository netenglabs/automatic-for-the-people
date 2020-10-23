The roles in this directory are meant to educate as well as allow for the building of different solutions by reusing as much of the blocks as possible. Towards this end, we use Jinja2 templates as infrequently as possible and even when we do use them, use them only with for loops and simple if conditions. Thus, we use cli_config with all NOS except Cumulus, and we use blockinfile for Cumulus. The final file rendered with Cumulus may not look nice (formatting, lots of block markers to make repeated runs and updates idempotent), but you can pull down nicer looking versions.

Look at deploy-evpn.yml in the 2t-clos-single-attach directory to see how to string together the roles defined here to configure EVPN in multiple different ways across NOS.

The primary trick to make the roles NOS-agnostic is to have tasks/main.yml that merely invokes the specific device's NOS implementation. Thus, the role cfg-evpn has a tasks/main.yml that invokes either eos.yml or nxos.yml etc, depending on the NOS used by the device and that YAML file implements the NOS-specific task to configure EVPN (in case of the cfg-evpn role).

To make the code work across multiple topologies and variations of a topology, it is important to keep any data out of the code. The current tasks don't entirely succeed (MTU and loopback interface for example are hardcoded in the plays, and need to be moved), but the basic idea is that: keep the data out of the code.

I also don't use a single large template model because then the roles aren't easily reusable. I break up each role into multiple subtasks to make it easier to catch errors in rendering.
