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
  options.apps.firefox = {
    enable = mkEnableOption "Enable GIMP";
  };

  config = mkIf apps.gimp.enable {
    environment.systemPackages = with pkgs; [
      gimp
    ];
  };
}
