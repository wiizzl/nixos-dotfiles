{ var, ... }:

{
  services.hyprpaper = {
    enable = true;

    settings = {
      preload = [ "${var.hyprland.wallpaper}" ];
      wallpaper = [ ", ${var.hyprland.wallpaper}" ];
    };
  };
}
