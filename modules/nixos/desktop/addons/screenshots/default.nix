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
  options.my.desktop.addons.screenshots = {
    enable = mkEnableOption "Enable screenshots with grim and slurp";
  };

  config = mkIf desktop.addons.screenshots.enable {
    environment.systemPackages = with pkgs; [
      grim
      slurp
    ];
  };
}
