{ config, lib, ... }:

with lib;
let
  inherit (config.my) apps;
in
{
  options.my.apps.media = {
    vlc.enable = mkEnableOption "VLC media player";
    mpv.enable = mkEnableOption "mpv media player";
    qimgv.enable = mkEnableOption "Qimgv image viewer";
  };
}
