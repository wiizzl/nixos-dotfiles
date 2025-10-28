{
  pkgs,
  config,
  lib,
  ...
}:

with lib;
let
  inherit (config) desktop;
in
{
  options.desktop.addons.hyprpicker = {
    enable = mkEnableOption "Enable hyprpicker";
  };

  config = mkIf desktop.addons.hyprpicker.enable {
    environment.systemPackages = with pkgs; [
      hyprpicker
    ];
  };
}
