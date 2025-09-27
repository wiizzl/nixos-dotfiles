{ config, pkgs, ... }:
let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;

  configs = {
    qtile = "qtile";
  };
in
{
  home = {
    username = "pier";
    homeDirectory = "/home/pier";
    stateVersion = "25.05";
  };

  xdg.configFile = builtins.mapAttrs (name: subpath: {
    source = create_symlink "${dotfiles}/${subpath}";
    recursive = true;
  }) configs;

  programs = {
    bash = {
      enable = true;
      shellAliases = {
        btw = "echo I use NixOS, btw";
        ff = "fastfetch";
      };
    };

    git = {
      enable = true;
      userName = "wiizzl";
      userEmail = "github@houlliere.com";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };

    zed-editor = {
      enable = true;
    };
  };
}
