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
  config = mkIf apps.browser.firefox.enable {
    environment.systemPackages = with pkgs; [
      firefox
    ];
  };
}
