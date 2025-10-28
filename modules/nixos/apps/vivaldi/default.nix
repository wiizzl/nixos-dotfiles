{
  pkgs,
  config,
  lib,
  ...
}:

with lib;
let
  inherit (config) apps;
in
{
  options.apps.vivaldi = {
    enable = mkEnableOption "Enable Vivaldi Browser";
  };

  config = mkIf apps.vivaldi.enable {
    environment.systemPackages = with pkgs; [
      vivaldi
    ];
  };
}
