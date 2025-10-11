{ config, ... }:

{
  wayland.windowManager.hyprland.settings = {
    input = {
      kb_layout = config.var.keyboardLayout;
      follow_mouse = 1;
      sensitivity = 0;
      repeat_delay = 300;

      touchpad = {
        natural_scroll = true;
        disable_while_typing = true;
        scroll_factor = 0.8;
      };
    };

    # Per-device config
    device = {
      name = "logitech-usb-receiver";
      sensitivity = -0.7;
    };

    gestures = {
      workspace_swipe = 1;
      workspace_swipe_fingers = 3;
      workspace_swipe_distance = 500;
      workspace_swipe_invert = 1;
      workspace_swipe_min_speed_to_force = 30;
      workspace_swipe_cancel_ratio = 0.5;
      workspace_swipe_create_new = 1;
      workspace_swipe_forever = 1;
    };
  };
}
