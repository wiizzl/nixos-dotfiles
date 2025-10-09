{ inputs, config, ... }:

{
  imports = [
    ./hardware-configuration.nix
    
    ../../nixos/audio.nix
    ../../nixos/bluetooth.nix
    ../../nixos/fonts.nix
    ../../nixos/nixos.nix
    ../../nixos/systemd-boot.nix
    ../../nixos/ly.nix
    ../../nixos/users.nix
    ../../nixos/utils.nix
    ../../nixos/podman.nix
    ../../nixos/virtmanager.nix
    ../../nixos/firewall.nix

    ./variables.nix
  ];

  home-manager = {
    users."${config.var.username}" = import ./home.nix;
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    extraSpecialArgs = { inherit inputs; };
  };

  system.stateVersion = "25.05";
}
