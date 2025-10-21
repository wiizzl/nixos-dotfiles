{ ... }:

{
  programs.bash = {
    enable = true;

    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles";
      ll = "eza -lha --icons=auto --sort=name --group-directories-first";
      cat = "bat";
      find = "fd";
      rg = "rg -C 4";
    };
  };
}
