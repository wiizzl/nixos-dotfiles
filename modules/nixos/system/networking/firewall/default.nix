{ config, lib, ... }:

with lib;
let
  inherit (config) system;
in
{
  options.system.networking.firewall = {
    enable = mkEnableOption "Enable Firewall";
  };

  config = mkIf system.networking.firewall.enable {
    networking.firewall = {
      enable = true;
    };
  };
}
