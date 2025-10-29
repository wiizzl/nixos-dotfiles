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
  config = mkIf apps.jetbrains.webstorm.enable {
    environment.systemPackages = with pkgs; [
      jetbrains.webstorm
    ];
  };
}
