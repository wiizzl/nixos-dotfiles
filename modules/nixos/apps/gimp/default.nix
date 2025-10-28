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
  options.my.apps.gimp = {
    enable = mkEnableOption "Enable GIMP";
  };

  config = mkIf apps.gimp.enable {
    environment.systemPackages = with pkgs; [
      gimp
    ];
  };
}
