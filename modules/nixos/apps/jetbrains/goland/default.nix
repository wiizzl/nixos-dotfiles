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
  config = mkIf apps.jetbrains.goland.enable {
    environment.systemPackages = with pkgs; [
      jetbrains.goland
    ];
  };
}
