{ config, lib, ... }:

with lib;
let
  inherit (config.my) apps;
in
{
  options.my.apps.file-manager = {
    thunar.enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Thunar file manager";
    };
    dolphin.enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Dolphin file manager";
    };
  };
}
