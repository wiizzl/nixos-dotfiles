{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # System
    gnome-icon-theme
    xfce.thunar
    warp-terminal
    mpv
    qimgv

    # Apps
    dbeaver-bin
    onlyoffice-desktopeditors
    thunderbird
    obs-studio
    slack
    gimp
    postman

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
