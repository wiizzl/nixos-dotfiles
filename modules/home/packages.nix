{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # System
    gnome-icon-theme
    xfce.thunar
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
    python315
    jdk
    lua
    zig
    rustup
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
    nitch
  ];
}
