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
  config = mkIf apps.file-manager.dolphin.enable {
    environment.systemPackages = with pkgs; [
      libsForQt5.dolphin
    ];
  };
}
