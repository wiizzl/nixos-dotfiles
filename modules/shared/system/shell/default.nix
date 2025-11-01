{ config, lib, ... }:

with lib;
let
  inherit (config.my) system cli;

  aliases = import ../aliases.nix;
in
{
  options.my.system.shell = {
    bash.enable = mkEnableOption "Enable Bash shell";
    fish.enable = mkEnableOption "Enable Fish shell";
    zsh.enable = mkEnableOption "Enable ZSH shell";
  };
}
