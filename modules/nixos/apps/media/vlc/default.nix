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
  config = mkIf apps.media.vlc.enable {
    environment.systemPackages = with pkgs; [
      vlc
    ];
  };
}
