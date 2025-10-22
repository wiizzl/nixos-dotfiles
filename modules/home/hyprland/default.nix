{ inputs, pkgs, ... }:

{
  imports = [
    ./binds.nix
    ./input.nix
    ./windows.nix
    ./look.nix
    ./animations.nix
    ./exec-once.nix
    ./hyprpaper.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;

    settings = {
      monitor = var.hyprland.monitors;
    };
  };
}
