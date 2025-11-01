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
  options.my.apps.jetbrains = {
    androidstudio.enable = mkEnableOption "Enable Jetbrains Android Studio IDE";
  };

  config = mkIf apps.jetbrains.androidstudio.enable {
    environment.systemPackages = with pkgs; [
      android-studio
    ];
  };
}
