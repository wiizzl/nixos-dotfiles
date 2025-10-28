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
  options.apps.brave = {
    enable = mkEnableOption "Enable Brave Browser";
  };

  config = mkIf apps.brave.enable {
    environment.systemPackages = with pkgs; [
      brave
    ];
  };
}
