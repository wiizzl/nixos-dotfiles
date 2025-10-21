{ config, pkgs, ... }:

{
  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };

    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };

  environment.systemPackages = with pkgs; [
    virt-viewer
    podman-desktop
  ];

  programs.virt-manager.enable = true;

  users.users.${config.var.username} = {
    extraGroups = [
      "libvirtd" # Virt manager/QEMU access
      "podman" # Allow access as non-root
    ];
  };
}
