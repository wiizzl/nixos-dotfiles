{ config, pkgs, ... }:

{
  virtualisation = {

    # Only enable either docker or podman -- Not both
    docker.enable = true;
    podman.enable = false;

    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };

  environment.systemPackages = with pkgs; [
    virt-viewer
    lazydocker
    docker-client
  ];

  programs.virt-manager.enable = true;

  users.users.${config.var.username} = {
    extraGroups = [
      "libvirtd" # #Virt manager/QEMU access
      "docker" # Allow access as non-root
    ];
  };
}
