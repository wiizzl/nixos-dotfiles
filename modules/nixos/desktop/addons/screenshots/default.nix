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
  options.desktop.addons.screenshots = {
    enable = mkEnableOption "Enable screenshots with grim and slurp";
  };

  config = mkIf desktop.addons.screenshots.enable {
    environment.systemPackages = with pkgs; [
      grim
      slurp
    ];
  };
}
