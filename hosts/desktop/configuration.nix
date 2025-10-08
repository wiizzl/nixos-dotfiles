{ config, ... }:

{
  imports = [
    ../../modules

    ./hardware-configuration.nix
    ../shared/variables.nix
  ];

  home-manager.users."${config.var.username}" = import ./home.nix;

  system.stateVersion = "25.05";
}
