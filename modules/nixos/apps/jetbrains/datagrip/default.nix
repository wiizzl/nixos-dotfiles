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
  options.my.apps.jetbrains = {
    datagrip.enable = mkEnableOption "Enable Jetbrains Database Manager";
  };

  config = mkIf apps.jetbrains.datagrip.enable {
    environment.systemPackages = with pkgs; [
      jetbrains.datagrip
    ];
  };
}
