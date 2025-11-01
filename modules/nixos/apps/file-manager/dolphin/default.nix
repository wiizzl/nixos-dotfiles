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
  options.my.apps.file-manager = {
    dolphin.enable = mkEnableOption "Dolphin file manager";
  };

  config = mkIf apps.file-manager.dolphin.enable {
    environment.systemPackages = with pkgs; [
      libsForQt5.dolphin
    ];
  };
}
