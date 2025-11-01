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
  config = mkIf apps.file-manager.thunar.enable {
    environment.systemPackages = with pkgs; [
      xfce.thunar
      xfce.thunar-archive-plugin
      xfce.tumbler
    ];
  };
}
