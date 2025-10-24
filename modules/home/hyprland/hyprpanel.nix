{ ... }:

{
  programs.hyprpanel = {
    enable = true;

    settings = {

    };
  };

  wayland.windowManager.hyprland.settings.exec-once = [ "hyprpanel" ];
}
