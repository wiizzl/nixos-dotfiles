{ var, pkgs, ... }:

{
  imports = [
    ./binds.nix
    ./input.nix
    ./windows.nix
    ./look.nix
    ./animations.nix
    ./exec-once.nix
    ./hyprpaper.nix
    ./waybar.nix
    ./workspaces.nix
    ./swaync.nix
  ];

  home.packages = with pkgs; [
    wl-clipboard
    hyprpicker
    hyprshot
    playerctl
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;

    settings = {
      monitor = var.hyprland.monitors.values;
    };
  };
}
