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

    # Per-device config
    device = {
      name = "logitech-usb-receiver";
      sensitivity = -0.7;
    };

    gesture = "3, horizontal, workspace";
  };
}
