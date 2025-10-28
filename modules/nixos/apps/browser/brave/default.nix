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
  options.my.apps.brave = {
    enable = mkEnableOption "Enable Brave Browser";
  };

  config = mkIf apps.brave.enable {
    environment.systemPackages = with pkgs; [
      brave
    ];
  };
}
