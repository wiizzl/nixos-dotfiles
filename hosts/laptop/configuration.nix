{ inputs, config, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./variables.nix
    ./theme.nix

    ../../modules/core
  ];
}
