{ config, lib, ... }:

with lib;
let
  inherit (config.my) cli;
in
{
  options.my.cli.direnv = {
    enable = mkEnableOption "Enable direnv";
  };

  config = mkIf cli.direnv.enable {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
