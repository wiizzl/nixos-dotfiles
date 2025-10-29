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
  options.my.desktop.addons.hyprshot = {
    enable = mkEnableOption "Enable hyprshot";
  };

  config = mkIf desktop.addons.hyprshot.enable {
    environment.systemPackages = with pkgs; [
      hyprshot
    ];
  };
}
