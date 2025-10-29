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
  config = mkIf apps.jetbrains.androidstudio.enable {
    environment.systemPackages = with pkgs; [
      android-studio
    ];
  };
}
