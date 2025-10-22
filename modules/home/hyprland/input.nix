{ var, ... }:

{
  wayland.windowManager.hyprland.settings = {
    input = {
      kb_layout = var.keyboardLayout;
      follow_mouse = 1;
      sensitivity = 0;
      repeat_delay = 300;

      touchpad = {
        natural_scroll = true;
        disable_while_typing = true;
        scroll_factor = 0.8;
      };
    };

    device = var.hyprland.device;

    gesture = [ "3, horizontal, workspace" ];
  };
}
