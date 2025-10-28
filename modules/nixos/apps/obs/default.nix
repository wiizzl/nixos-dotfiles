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
  options.apps.obs = {
    enable = mkEnableOption "Enable Open Broadcaster Software (OBS) Studio";
  };

  config = mkIf apps.obs.enable {
    environment.systemPackages = with pkgs; [
      obs-studio
    ];
  };
}
