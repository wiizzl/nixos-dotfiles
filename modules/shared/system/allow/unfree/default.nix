{ config, lib, ... }:

with lib;
let
  inherit (config) system;
in
{
  options.system.allow.unfree = {
    enable = mkEnableOption "Allow unfree packages";
  };

  config = mkIf system.allow.unfree.enable {
    nixpkgs.config.allowUnfree = true;
  };
}
