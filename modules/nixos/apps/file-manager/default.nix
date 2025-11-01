{ config, lib, ... }:

with lib;
let
  inherit (config.my) apps;
in
{
  options.my.apps.file-manager = {
    thunar = mkEnableOption "Thunar file manager";
    dolphin = mkEnableOption "Dolphin file manager";
  };
}
