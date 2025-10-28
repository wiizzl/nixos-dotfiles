{ config, lib, ... }:

with lib;
let
  inherit (config.my) system;
in
{
  options.my.system.boot = {
    systemd = mkOption {
      type = types.bool;
      default = false;
      description = "Enable systemd-boot as the bootloader";
    };
    grub = mkOption {
      type = types.bool;
      default = false;
      description = "Enable grub as the bootloader";
    };
    kernel = mkOption {
      type = types.package;
      default = pkgs.linuxPackages_rt_latest;
      description = "Enable grub as the bootloader";
    };
  };

  config = {
    boot = {
      kernelPackages = system.boot.kernel;
      tmp.cleanOnBoot = true;
    };
  };
}
