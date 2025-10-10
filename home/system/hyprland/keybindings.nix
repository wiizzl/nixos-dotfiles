{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    
    bind = [
      "$mod, Return, exec, kitty"
      "$mod, D, exec, rofi -show drun"
      "$mod, D, exec, dolphin"

      "$mod, Q, killactive"
      "$mod, V, togglefloating"
    ];
  };
}
