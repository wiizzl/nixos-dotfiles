{ inputs, pkgs, ... }:

{
  imports = [
    ./binds.nix
    ./input.nix
    ./windows.nix
    ./monitors.nix
    ./look.nix
    ./animations.nix
    ./exec-once.nix
    ./waybar.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
  };
}