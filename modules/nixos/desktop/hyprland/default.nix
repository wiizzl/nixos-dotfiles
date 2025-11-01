{
  pkgs,
  config,
  lib,
  inputs,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;
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

      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage =
        inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
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
          gnome-icon-theme
          adwaita-icon-theme
        ]
        ++ (if system.audio.pipewire.enable || system.networkmanager.enable then [ pavucontrol ] else [ ])
        ++ (if system.networking.networkmanager.enable then [ networkmanagerapplet ] else [ ]);
    };
  };
}
