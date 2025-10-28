{ config, lib, ... }:

with lib;
let
  inherit (config.my) system;
in
{
  options.my.system.networking.firewall = {
    enable = mkEnableOption "Enable Firewall";
  };

  config = mkIf system.networking.firewall.enable {
    networking.firewall = {
      enable = true;
    };
  };
}
