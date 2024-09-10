NOS_MEM = {
  "cumulus" => 2048,
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
  "cumulus" => "> 3.7.5, < 5.9.0",
  "nxos" => "0",
  "eos" => "4.29.2F",
  "junos" => "0.4.0",
  "iosxr" => "6.6.2",
}

SERVER_BOX = "generic/ubuntu2004"
FIREWALL_BOX = "generic/ubuntu2004"
