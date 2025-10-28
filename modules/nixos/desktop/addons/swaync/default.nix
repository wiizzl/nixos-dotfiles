{
  pkgs,
  config,
  lib,
  ...
}:

with lib;
let
  inherit (config.my) desktop;
in
{
  options.my.desktop.addons.swaync = {
    enable = mkEnableOption "Enable Sway Notifications Center (swaync)";
  };

  config = mkIf desktop.addons.swaync.enable {
    environment.systemPackages = with pkgs; [
      swaynotificationcenter
      libnotify
    ];
  };
}
