{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;

    loginShellInit = "starship init fish | source";

    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles";
    };
  };

  users.users.${config.var.username}.shell = pkgs.fish;
}
