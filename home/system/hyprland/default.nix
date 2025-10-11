{ inputs, pkgs, ... }:

{
  imports = [
    ./keybindings.nix
    ./input.nix
    ./windows.nix
    ./monitors.nix
    ./look.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
  };

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # Hint Electron apps to use Wayland
  };
}