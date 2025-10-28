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
  options.my.apps.element = {
    enable = mkEnableOption "Enable Element Matrix Client";
  };

  config = mkIf apps.element.enable {
    environment.systemPackages = with pkgs; [
      element-desktop
    ];
  };
}
