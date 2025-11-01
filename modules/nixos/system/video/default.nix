{ config, lib, ... }:

with lib;
let
  inherit (config.my) system;
in
{
  options.my.system.video = {
    amd.enable = mkEnableOption "Enable AMD graphics support";
    nvidia.enable = mkEnableOption "Enable NVIDIA graphics support";
  };
}
