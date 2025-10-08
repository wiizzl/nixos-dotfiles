{ config, ... }:

{
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  users.users.${config.var.username} = {
    extraGroups = [
      "libvirtd"
    ];
  };
}
