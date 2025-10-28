{ config, lib, ... }:

with lib;
let
  inherit (config.my) desktop;
in
{
  options.my.desktop.addons.ly = {
    enable = mkEnableOption "Enable ly display manager";
  };

  config = mkIf desktop.addons.ly.enable {
    services.displayManager.ly.enable = true;
  };
}
