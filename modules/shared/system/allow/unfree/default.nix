{ config, lib, ... }:

with lib;
let
  inherit (config.my) system;
in
{
  options.my.system.allow.unfree = {
    enable = mkEnableOption "Allow unfree packages";
  };

  config = mkIf system.allow.unfree.enable {
    nixpkgs.config.allowUnfree = true;
  };
}
