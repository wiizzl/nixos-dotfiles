{ inputs, ... }:

{
  imports = [
    ./keybinds.nix
  ];

  programs.kitty.enable = true; # Required by hyprland

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;

    xwayland.enable = true;
  };

  home.sessionVariables.NIXOS_OZONE_WL = "1"; # Hint Electron apps to use Wayland
}