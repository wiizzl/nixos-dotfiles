{ pkgs, config, ... }:

let
  username = config.var.username;
in
{
  imports = [
    ./variables.nix

    ../../home/programs/shell
    ../../home/programs/fastfetch
    ../../home/programs/git
    ../../home/programs/spicetify
    ../../home/programs/discord
    ../../home/programs/zen
    ../../home/programs/vscode

    ../../home/system/hyprland
    ../../home/system/vicinae
    ../../home/system/rofi
  ];

  home = {
    username = username;
    homeDirectory = "/home/" + username;

    packages = with pkgs; [
      # Apps
      google-chrome
      onlyoffice-desktopeditors
      dbgate
      thunderbird
      slack
      localsend
      podman-desktop

      # Dev
      go
      bun
      nodejs
      pnpm
      uv
      jdk
      gcc
      gnumake

      # Utils
      zip
      unzip
      tldr
      killall

      # Just cool
      peaclock
      cbonsai
      pipes
      cmatrix
      cava
    ];

    stateVersion = "25.05";
  };

  programs.home-manager.enable = true;
}
