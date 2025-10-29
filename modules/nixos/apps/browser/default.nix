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
    firefox.enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Firefox browser";
    };
    chromium.enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Chromium browser";
    };
  };
}
