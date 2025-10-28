{ config, lib, ... }:

with lib;
let
  inherit (config.my) system;
in
{
  options.my.system.allow.broken = {
    enable = mkEnableOption "Allow broken packages";
  };

  config = mkIf system.allow.broken.enable {
    nixpkgs.config.allowBroken = true;
  };
}
