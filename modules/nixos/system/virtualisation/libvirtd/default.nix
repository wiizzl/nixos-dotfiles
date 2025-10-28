{ config, lib, ... }:

with lib;
let
  inherit (config) system user;
in
{
  options.system.virtualisation.libvirtd = {
    enable = mkEnableOption "Enable libvirtd";
    virt-manager = mkOption {
      type = types.bool;
      default = false;
      description = "Enable virt-manager GUI";
    };
  };

  config = mkIf system.virtualisation.libvirtd.enable {
    virtualisation.libvirtd = {
      enable = true;
    };

    users.users.${user.name}.extraGroups = [ "libvirtd" ];
    programs.virt-manager.enable = system.virtualisation.libvirtd.virt-manager;
  };
}
