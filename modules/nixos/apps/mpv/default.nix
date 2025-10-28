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
  options.my.apps.mpv = {
    enable = mkEnableOption "Enable mpv media player";
  };

  config = mkIf apps.mpv.enable {
    environment.systemPackages = with pkgs; [
      mpv
    ];
  };
}
