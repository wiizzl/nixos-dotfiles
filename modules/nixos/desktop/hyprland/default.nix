{
  pkgs,
  config,
  lib,
  inputs,
  ...
}:

with lib;
let
  inherit (config.my) desktop system;
in
{
  options.my.desktop.hyprland = {
    enable = mkEnableOption "Enable Hyprland desktop environment";
  };

  config = mkIf desktop.hyprland.enable {
    nix.settings = {
      substituters = [ "https://hyprland.cachix.org" ];
      trusted-substituters = [ "https://hyprland.cachix.org" ];
      trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
    };

    programs.hyprland = {
      enable = true;
      xwayland.enable = true;

      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
    };

    environment = {
      sessionVariables = {
        NIXOS_OZONE_WL = "1"; # Hint Electron apps to use Wayland
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      };

      systemPackages =
        with pkgs;
        [
          playerctl
          wl-clipboard
          # gnome-icon-theme # TODO: check if I want this one too
          hicolor-icon-theme
          adwaita-icon-theme
        ]
        ++ optionals system.audio.pipewire
        ||
          system.audio.pulseaudio [ pavucontrol ]
          ++ optionals system.networkmanager [
            networkmanagerapplet
          ];
    };
  };
}
