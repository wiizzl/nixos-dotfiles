{ config, lib, ... }:

with lib;
let
  inherit (config.my) apps;
in
{
  options.my.apps.browser = {
    firefox = mkEnableOption "Enable Firefox browser";
    chromium = mkEnableOption "Enable Chromium browser";
  };
}
