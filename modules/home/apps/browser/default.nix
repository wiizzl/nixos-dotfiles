{ config, lib, ... }:

with lib;
let
  inherit (config.my) apps;
in
{
  options.my.apps.browser = {
    zen.enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Zen browser";
    };
  };
}
