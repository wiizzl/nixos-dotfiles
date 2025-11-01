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
    webstorm.enable = mkEnableOption "Enable Jetbrains Web IDE";
  };

  config = mkIf apps.jetbrains.webstorm.enable {
    environment.systemPackages = with pkgs; [
      jetbrains.webstorm
    ];
  };
}
