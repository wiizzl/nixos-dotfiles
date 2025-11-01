{ config, lib, ... }:

with lib;
let
  inherit (config.my) system cli;

  aliases = import ../aliases.nix;
in
{
  config = mkIf system.shell.zsh.enable {
    programs.zsh = {
      enable = true;

      shellAliases = {
        nfu = "cd ~/nix-config && sudo nix flake update";
      };
    };
  };
}
