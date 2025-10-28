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
  options.my.apps.vlc = {
    enable = mkEnableOption "Enable VLC media player";
  };

  config = mkIf apps.vlc.enable {
    environment.systemPackages = with pkgs; [
      vlc
    ];
  };
}
