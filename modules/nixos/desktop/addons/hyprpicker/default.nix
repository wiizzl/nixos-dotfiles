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
  options.my.desktop.addons.hyprpicker = {
    enable = mkEnableOption "Enable hyprpicker";
  };

  config = mkIf desktop.addons.hyprpicker.enable {
    environment.systemPackages = with pkgs; [
      hyprpicker
    ];
  };
}
