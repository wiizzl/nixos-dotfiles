{
  pkgs,
  config,
  lib,
  ...
}:

with lib;
let
  inherit (config.my) system;
in
{
  config = mkIf system.video.amd.enable {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}
