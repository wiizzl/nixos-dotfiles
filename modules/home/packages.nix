{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # System
    kdePackages.dolphin
    warp-terminal
    mpv

    # Apps
    dbeaver-bin
    onlyoffice-desktopeditors
    thunderbird
    obs-studio
    slack
    gimp
    yaak

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
