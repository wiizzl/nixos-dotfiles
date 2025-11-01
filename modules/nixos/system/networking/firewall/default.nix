{ config, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;
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
