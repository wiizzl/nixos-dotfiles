{ pkgs, ... }:

{
  home.packages = with pkgs; [
    home-manager

    # System
    kdePackages.dolphin
    warp-terminal

    # Apps
    onlyoffice-desktopeditors
    dbgate
    thunderbird
    slack
    vlc
    gimp

    # Dev
    go
    bun
    nodejs
    pnpm
    uv
    jdk
    gcc
    gnumake
    nixfmt

    # Utils
    tldr

    # Just cool
    peaclock
    cbonsai
    pipes
    cmatrix
    cava
  ];
}
