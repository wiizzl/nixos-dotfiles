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
  options.my.apps.chromium = {
    enable = mkEnableOption "Enable Chromium browser";
  };

  config = mkIf apps.chromium.enable {
    environment.systemPackages = with pkgs; [
      ungoogled-chromium
    ];
  };
}
