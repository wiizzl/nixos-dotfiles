{ pkgs, config, ... }:

{
  imports = [
    ./variables.nix

    ../../home/programs/ghostty
    ../../home/programs/shell
    ../../home/programs/fastfetch
    ../../home/programs/git
    ../../home/programs/spicetify
    ../../home/programs/discord
    ../../home/programs/zen
    ../../home/programs/zed

    ../../home/system/zathura
    ../../home/system/rofi
    ../../home/system/nnn
    ../../home/system/dunst
  ];

  home = {
    inherit (config.var) username;
    homeDirectory = "/home/" + config.var.username;

    packages = with pkgs; [
      # Apps
      vlc
      google-chrome
      onlyoffice-desktopeditors
      pavucontrol
      dbgate
      thunderbird

      # Dev
      go
      bun
      nodejs
      pnpm
      uv
      jdk
      dotnetCorePackages.sdk_9_0-bin
      nil
      gcc
      gnu-cobol

      # Utils
      zip
      unzip
      htop-vim
      tldr
      bat

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
