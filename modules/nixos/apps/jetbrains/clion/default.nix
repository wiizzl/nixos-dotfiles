{
  pkgs,
  config,
  lib,
  ...
}:

with lib;
let
  inherit (config.my) apps;
in
{
  config = mkIf apps.jetbrains.clion.enable {
    environment.systemPackages = with pkgs; [
      jetbrains.clion
    ];
  };
}
