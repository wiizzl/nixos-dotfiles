{ config, lib, ... }:

with lib;
let
  inherit (config) desktop;
in
{
  options.desktop.addons.ly = {
    enable = mkEnableOption "Enable ly display manager";
  };

  config = mkIf desktop.addons.ly.enable {
    services.displayManager.ly.enable = true;
  };
}
