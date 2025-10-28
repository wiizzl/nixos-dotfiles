{ config, lib, ... }:

with lib;
let
  inherit (config) cli;
in
{
  options.cli.direnv = {
    enable = mkEnableOption "Enable direnv";
  };

  config = mkIf cli.direnv.enable {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
