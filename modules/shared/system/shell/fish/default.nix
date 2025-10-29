{ config, lib, ... }:

with lib;
let
  inherit (config.my) system cli;

  aliases = import ../aliases.nix;
in
{
  options.my.system.shell.fish = {
    enable = mkEnableOption "Enable fish";
  };

  config = mkIf system.shell.fish.enable {
    programs.fish = {
      enable = true;

      shellAliases = {
        nfu = "cd ~/nix-config && sudo nix flake update";
      };

      interactiveShellInit = ''
        set fish_greeting
      '';
    };
  };
}
