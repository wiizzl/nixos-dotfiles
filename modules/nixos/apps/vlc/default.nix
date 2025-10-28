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
  options.apps.vlc = {
    enable = mkEnableOption "Enable VLC media player";
  };

  config = mkIf apps.vlc.enable {
    environment.systemPackages = with pkgs; [
      vlc
    ];
  };
}
