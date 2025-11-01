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
  options.my.apps.browser = {
    firefox.enable = mkEnableOption "Enable Firefox browser";
  };

  config = mkIf apps.browser.firefox.enable {
    environment.systemPackages = with pkgs; [
      firefox
    ];
  };
}
