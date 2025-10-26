{ var, pkgs, ... }:

{
  services.hyprpaper = {
    enable = true;

    settings = {
      ipc = "off";
      splash = false;

      preload = [ "~/nixos-dotfiles/wallpapers/${var.hyprland.wallpaper}" ];
      wallpaper = [ ", ~/nixos-dotfiles/wallpapers/${var.hyprland.wallpaper}" ];
    };
  };

  wayland.windowManager.hyprland.settings.exec-once = [ "${pkgs.hyprpaper}/bin/hyprpaper" ];
}
