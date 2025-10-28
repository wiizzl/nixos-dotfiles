{ config, lib, ... }:

with lib;
let
  inherit (config.my) system;

  aliases = import ../aliases.nix;
in
{
  options.my.system.shell.fish = {
    enable = mkEnableOption "Enable fish";
  };

  config = mkIf system.shell.fish.enable {
    programs.fish = {
      enable = true;

      # TODO: add dynamic aliases
    };
  };
}
