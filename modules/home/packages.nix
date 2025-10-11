{ pkgs, ... }:

{
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
}
