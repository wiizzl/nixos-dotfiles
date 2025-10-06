{ config, ... }:

{
  imports = [
    ../../nixos/audio.nix
    ../../nixos/bluetooth.nix
    ../../nixos/fonts.nix
    ../../nixos/home-manager.nix
    ../../nixos/nixos.nix
    ../../nixos/systemd-boot.nix
    ../../nixos/ly.nix
    # ../../nixos/i3.nix
    ../../nixos/picom.nix
    ../../nixos/users.nix
    ../../nixos/utils.nix
    ../../nixos/podman.nix
    ../../nixos/virtmanager.nix

    ./hardware-configuration.nix
    ./variables.nix
  ];

  home-manager.users."${config.var.username}" = import ./home.nix;

  system.stateVersion = "25.05";
}
