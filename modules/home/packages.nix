{ pkgs, ... }:

{
  home.packages = with pkgs; [
    home-manager

    # System
    kdePackages.dolphin
    warp-terminal

    # Apps
    onlyoffice-desktopeditors
    dbeaver-bin
    thunderbird
    obs-studio
    slack
    mpv
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
    eza
    bat
    fd
    fzf
    ripgrep
    yazi

    # Just cool
    peaclock
    cbonsai
    pipes
    cmatrix
    cava
  ];
}
