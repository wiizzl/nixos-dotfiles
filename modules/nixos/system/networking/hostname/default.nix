{ config, lib, ... }:

with lib;
let
  inherit (config) system;
in
{
  options.system.networking.hostname = mkOption {
    type = types.str;
    default = "nixos";
    description = "System hostname";
  };

  config = {
    networking.hostName = system.networking.hostname;
  };
}
