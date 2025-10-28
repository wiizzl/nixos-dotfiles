{ config, lib, ... }:

with lib;
let
  inherit (config) system;
in
{
  options.system.services.bluetooth = {
    enable = mkEnableOption "Enable Bluetooth";
    blueman = mkOption {
      type = types.bool;
      default = false;
      description = "Enable blueman-applet and blueman-manager";
    };
  };

  config = mkIf system.services.bluetooth.enable {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;

      settings = {
        Policy.AutoEnable = true;
        General.Experimental = true;
      };
    };

    services.blueman.enable = system.services.bluetooth.blueman;
  };
}
