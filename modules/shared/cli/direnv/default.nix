{ config, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;
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
