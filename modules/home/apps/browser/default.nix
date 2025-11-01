{ config, lib, ... }:

with lib;
let
  inherit (config.my) apps;
in
{
  options.my.apps.browser = {
    zen.enable = mkEnableOption "Enable Zen browser";
  };
}
