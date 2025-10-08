{ pkgs, config, ... }:

{
  imports = [
    ../shared/variables.nix

    ../../home-modules/desktop
    ../../home-modules/programs
    ../../home-modules/terminals
  ];

  home = {
    inherit (config.var) username;
    homeDirectory = "/home/" + config.var.username;

    packages = with pkgs; [
      # Apps
      google-chrome
      onlyoffice-desktopeditors
      dbgate
      thunderbird
      slack
      localsend
      podman-desktop
      android-studio
      jetbrains.rider

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
      gnumake
      gnu-cobol

      # Utils
      zip
      unzip
      htop-vim
      tldr
      bat
      flameshot

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
