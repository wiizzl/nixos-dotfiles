{ config, lib, ... }:

with lib;
let
  inherit (config) system;
in
{
  options.system.allow.broken = {
    enable = mkEnableOption "Allow broken packages";
  };

  config = mkIf system.allow.broken.enable {
    nixpkgs.config.allowBroken = true;
  };
}
