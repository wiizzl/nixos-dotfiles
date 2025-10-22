{ var, ... }:

{
  programs.bash = {
    enable = true;

    shellAliases = {
      ll = "eza -lha --icons=auto --sort=name --group-directories-first";
      cat = "bat";
      find = "fd";
      rg = "rg -C 4";
    };

    bashrcExtra = ''
      nrs() {
        if [ -z "$1" ]; then
          echo "Usage: nrs <host>" >&2
          return 1
        fi

        sudo nixos-rebuild switch --flake "nixos-dotfiles#$1"
      }
    '';
  };
}
