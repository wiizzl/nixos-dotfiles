{ pkgs, ... }:

{
  home.packages = with pkgs; [
    home-manager

    # System
    kdePackages.dolphin
    papers
    loupe

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
}
