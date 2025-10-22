{ var, pkgs, ... }:

{
  services.hyprpaper = {
    enable = true;

    settings = {
      ipc = "on";

      preload = [ "~/nixos-dotfiles/wallpapers/${var.hyprland.wallpaper}" ];
      wallpaper = [ ", ~/nixos-dotfiles/wallpapers/${var.hyprland.wallpaper}" ];
    };
  };

  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "${pkgs.hyprpaper}/bin/hyprpaper"
    ];
  };
}
