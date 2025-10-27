{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Icons themes
    gnome-icon-theme
    adwaita-icon-theme

    # System
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

    # Utils
    nixfmt
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
