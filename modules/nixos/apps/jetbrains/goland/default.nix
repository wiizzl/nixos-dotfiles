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
    goland.enable = mkEnableOption "Enable Jetbrains Go IDE";
  };

  config = mkIf apps.jetbrains.goland.enable {
    environment.systemPackages = with pkgs; [
      jetbrains.goland
    ];
  };
}
