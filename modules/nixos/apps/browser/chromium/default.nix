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
    chromium.enable = mkEnableOption "Enable Chromium browser";
  };

  config = mkIf apps.browser.chromium.enable {
    environment.systemPackages = with pkgs; [
      ungoogled-chromium
    ];
  };
}
