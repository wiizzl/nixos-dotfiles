{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    input = {
      kb_layout = "fr";
      follow_mouse = 1;
      sensitivity = 0;

      touchpad = {
        natural_scroll = true;
      };
    };

    device = {
      name = "";
      sensitivity = 0;
    };

    gesture = "3, horizontal, workspace";
  };
}
