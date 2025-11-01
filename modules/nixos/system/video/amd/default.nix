{ config, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  inherit (config.my) system;
in
{
  options.my.system.video = {
    amd.enable = mkEnableOption "Enable AMD graphics support";
  };

  config = mkIf system.video.amd.enable {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}
