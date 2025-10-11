{ inputs, config, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./variables.nix
    
    ../../modules/core
  ];
}
