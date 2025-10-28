{ config, lib, ... }:

with lib;
let
  inherit (config) system;

  aliases = import ../aliases.nix;
in
{
  options.system.zsh.bash = {
    enable = mkEnableOption "Enable zsh";
  };

  config = mkIf system.shell.zsh.enable {
    programs.zsh = {
      enable = true;

      # TODO: add dynamic aliases
    };
  };
}
