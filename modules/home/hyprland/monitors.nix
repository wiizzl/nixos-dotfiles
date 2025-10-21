{ var, ... }:

{
  wayland.windowManager.hyprland.settings = {
    monitor = var.hyprland.monitors;
  };
}
