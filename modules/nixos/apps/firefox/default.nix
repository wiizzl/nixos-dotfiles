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
  options.my.apps.firefox = {
    enable = mkEnableOption "Enable Firefox browser";
  };

  config = mkIf apps.firefox.enable {
    environment.systemPackages = with pkgs; [
      firefox
    ];
  };
}
