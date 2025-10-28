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
    enable = mkEnableOption "Enable Firefox Browser";
  };

  config = mkIf apps.firefox.enable {
    environment.systemPackages = with pkgs; [
      firefox
    ];
  };
}
