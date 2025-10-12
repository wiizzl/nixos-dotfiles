{ inputs, ... }:

{
  imports = [
    ./boot.nix
    ./dm.nix
    ./fonts.nix
    ./network.nix
    ./printing.nix
    ./system.nix
    ./users.nix
    ./virtualisation.nix
    ./xserver.nix
    ./packages.nix
    ./ssh.nix
    ./hyprland.nix
    ./bluetooth.nix
    ./audio.nix

    inputs.stylix.nixosModules.stylix
  ];
}
