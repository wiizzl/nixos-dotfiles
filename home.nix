{ config, pkgs, ... }:
let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;

  configs = {
    qtile = "qtile";
    zed = "zed";
    alacritty = "alacritty";
    fastfetch = "fastfetch";
    rofi = "rofi";
    cava = "cava";
  };
in
{
  imports = [
    ./modules/zed.nix
    ./modules/git.nix
    ./modules/discord.nix
    ./modules/spotify.nix
    ./modules/zen.nix
  ];

  home = {
    username = "pier";
    homeDirectory = "/home/pier";
    stateVersion = "25.05";

    packages = with pkgs; [
      fastfetch
      dbeaver-bin
      rofi
      pavucontrol
      bun
      nodejs
      cava
      thunderbird
    ];
  };

  xdg.configFile = builtins.mapAttrs (name: subpath: {
    source = create_symlink "${dotfiles}/${subpath}";
    recursive = true;
  }) configs;

  programs = {
    home-manager = {
      enable = true;
    };

    bash = {
      enable = true;
      shellAliases = {
        nrs = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#nixos";
      };
    };

    starship = {
      enable = true;
    };
  };
}
