{ ... }:

{
  programs.bash = {
    enable = true;

    shellAliases = {
      ll = "eza -lha --icons=auto --sort=name --group-directories-first";
      tree = "eza --icons=auto -T";
      cat = "bat";
      find = "fd";
      rg = "rg -C 4";

      nfu = "cd ~/nixos-dotfiles && sudo nix flake update";
    };

    bashrcExtra = ''
      nrs() {
        if [ -z "$1" ]; then
          echo "Usage: nrs <host> [additional nixos-rebuild args]" >&2
          return 1
        fi

        host="$1"
        shift

        nixos-rebuild switch --sudo --flake "$HOME/nixos-dotfiles#$host" "$@"
      }
    '';
  };
}
