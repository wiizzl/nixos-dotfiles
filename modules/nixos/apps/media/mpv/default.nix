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
  config = mkIf apps.media.mpv.enable {
    environment.systemPackages = with pkgs; [
      mpv
    ];
  };
}
