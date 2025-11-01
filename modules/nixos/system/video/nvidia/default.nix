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
  config = mkIf system.video.nvidia.enable {
    # TODO: Add NVIDIA graphics configuration here
  };
}
