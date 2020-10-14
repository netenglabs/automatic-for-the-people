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


