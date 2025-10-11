{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      # "systemctl --user start hyprpolkitagent" # https://wiki.hypr.land/Hypr-Ecosystem/hyprpolkitagent
    ];
  };
}
