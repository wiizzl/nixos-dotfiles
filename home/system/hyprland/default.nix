{ inputs, pkgs, ... }:

{
  imports = [
    ./keybindings.nix
    ./input.nix
    ./windows.nix
    ./monitors.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;

    xwayland.enable = true;
  };

  home.sessionVariables.NIXOS_OZONE_WL = "1"; # Hint Electron apps to use Wayland
}