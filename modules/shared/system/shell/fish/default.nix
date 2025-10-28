{ config, lib, ... }:

with lib;
let
  inherit (config) system;

  aliases = import ../aliases.nix;
in
{
  options.system.fish.bash = {
    enable = mkEnableOption "Enable fish";
  };

  config = mkIf system.shell.fish.enable {
    programs.fish = {
      enable = true;

      # TODO: add dynamic aliases
    };
  };
}
