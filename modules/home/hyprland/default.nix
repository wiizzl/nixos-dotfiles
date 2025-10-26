{ var, ... }:

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
    ./hyprexpo.nix
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
