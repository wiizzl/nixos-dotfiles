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
  options.my.apps.vivaldi = {
    enable = mkEnableOption "Enable Vivaldi Browser";
  };

  config = mkIf apps.vivaldi.enable {
    environment.systemPackages = with pkgs; [
      vivaldi
    ];
  };
}
