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
  config = mkIf apps.social.element.enable {
    environment.systemPackages = with pkgs; [
      element-desktop
    ];
  };
}
