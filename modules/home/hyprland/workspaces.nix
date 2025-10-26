{ var, ... }:

{
  wayland.windowManager.hyprland.settings =
    if builtins.length var.hyprland.monitors > 0 then
      {
        workspace = [
          "1, monitor:DP-2, default:true²"
          "2, monitor:DP-2"
          "3, monitor:DP-2"
          "4, monitor:DP-2"
          "5, monitor:DP-2"
          "6, monitor:DP-2"
          "7, monitor:DP-2"
          "8, monitor:DP-2"
          "9, monitor:DP-2"
          "10, monitor:DP-2"
          "11, monitor:HDMI-A-2, default:true"
        ];
      }
    else
      { };
}
