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
  options.my.system.video = {
    nvidia.enable = mkEnableOption "Enable NVIDIA graphics support";
  };

  config = mkIf system.video.nvidia.enable {
    # TODO: Add NVIDIA graphics configuration here
  };
}
