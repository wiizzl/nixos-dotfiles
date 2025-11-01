{ config, lib, ... }:

with lib;
let
  inherit (config.my) system;
in
{
  options.my.system.boot = {
    systemd.enable = mkEnableOption "Enable systemd-boot as the bootloader";
  };

  config = mkIf system.boot.systemd.enable {
    boot.loader.systemd-boot = {
      enable = true;
      consoleMode = "auto";
      configurationLimit = 8;
    };
  };
}
