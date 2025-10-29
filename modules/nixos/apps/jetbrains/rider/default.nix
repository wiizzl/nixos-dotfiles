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
  config = mkIf apps.jetbrains.rider.enable {
    environment.systemPackages = with pkgs; [
      jetbrains.rider
    ];
  };
}
