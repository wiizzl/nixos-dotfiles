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
    phpstorm.enable = mkEnableOption "Enable Jetbrains PHP IDE";
  };

  config = mkIf apps.jetbrains.phpstorm.enable {
    environment.systemPackages = with pkgs; [
      jetbrains.phpstorm
    ];
  };
}
