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
  config = mkIf apps.jetbrains.datagrip.enable {
    environment.systemPackages = with pkgs; [
      jetbrains.datagrip
    ];
  };
}
