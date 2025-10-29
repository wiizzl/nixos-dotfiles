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
  config = mkIf apps.browser.chromium.enable {
    environment.systemPackages = with pkgs; [
      ungoogled-chromium
    ];
  };
}
