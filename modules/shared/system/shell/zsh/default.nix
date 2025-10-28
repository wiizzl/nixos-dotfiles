{ config, lib, ... }:

with lib;
let
  inherit (config.my) system;

  aliases = import ../aliases.nix;
in
{
  options.my.system.shell.zsh = {
    enable = mkEnableOption "Enable zsh";
  };

  config = mkIf system.shell.zsh.enable {
    programs.zsh = {
      enable = true;

      # TODO: add dynamic aliases
    };
  };
}
