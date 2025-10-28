{ config, lib, ... }:

with lib;
let
  inherit (config.my) system;
in
{
  config = mkIf system.boot.grub {
    boot.loader.grub = {
      enable = true;
      useOSProber = true; # NOTE: this only work with Windows, if you want other OS, go for systemd-boot
      efiSupport = true;
      device = "nodev";
      configurationLimit = 8;
    };
  };
}
