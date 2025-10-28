{ config, lib, ... }:

with lib;
let
  inherit (config) system;

  aliases = import ../aliases.nix;
in
{
  options.system.shell.bash = {
    enable = mkEnableOption "Enable bash";
  };

  config = mkIf system.shell.bash.enable {
    programs.bash = {
      enable = true;

      # TODO: add dynamic aliases

      # shellAliases = {
      #   ll = "eza -lha --icons=auto --sort=name --group-directories-first";
      #   tree = "eza --icons=auto -T";
      #   cat = "bat";
      #   find = "fd";
      #   rg = "rg -C 4";

      #   nfu = "cd ~/nix-config && sudo nix flake update";
      # };

      # bashrcExtra = ''
      #   nrs() {
      #     if [ -z "$1" ]; then
      #       echo "Usage: nrs <host> [additional nixos-rebuild args]" >&2
      #       return 1
      #     fi

      #     host="$1"
      #     shift

      #     nixos-rebuild switch --sudo --flake "$HOME/nix-config#$host" "$@"
      #   }

      #   nd() {
      #     if [ -z "$1" ]; then
      #       echo "Usage: nd <shell> [additional nix develop args]" >&2
      #       return 1
      #     fi

      #     shell="$1"
      #     shift

      #     nix develop "$HOME/nix-config#$shell" "$@"
      #   }
      # '';
    };
  };
}
