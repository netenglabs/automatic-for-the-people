NOS_MEM = {
  "cumulus" => 768,
  "nxos" => 6144,
  "junos" => 2048,
  "eos" => 2048,
  "iosxr" => 7168
}

NOS_BOX = {
  "cumulus" => "CumulusCommunity/cumulus-vx",
  "nxos" => "cisco/nxosv",
  "junos" => "juniper/vqfx10k-re",
  "eos" => "arista/veos",
  "iosxr" => "cisco/iosxrv9k",
}

NOS_VERSION = {
  "cumulus" => "> 3.7.5, < 4.2.0",
  "nxos" => "0",
  "eos" => "4.23.5M",
  "junos" => "0.4.0",
  "iosxr" => "6.6.2",
}

SERVER_BOX = "generic/ubuntu1804"
FIREWALL_BOX = "generic/ubuntu1804"
