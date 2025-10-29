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
  options.my.apps.media = {
    vlc.enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable VLC media player";
    };
    mpv.enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable mpv media player";
    };
    qimgv.enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable VLC media player";
    };
  };
}
