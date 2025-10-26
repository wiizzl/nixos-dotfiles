{ var, ... }:

{
  wayland.windowManager.hyprland.settings =
    let
      monitors = var.hyprland.monitors;
    in
    {
      workspace =
        if builtins.length monitors.values > 1 then
          [
            "1, monitor:${monitors.primary}, default:true, persistent:true"
            "2, monitor:${monitors.primary}, persistent:true"
            "3, monitor:${monitors.primary}, persistent:true"
            "4, monitor:${monitors.primary}, persistent:true"
            "5, monitor:${monitors.primary}, persistent:true"
            "6, monitor:${monitors.primary}, persistent:true"
            "7, monitor:${monitors.primary}, persistent:true"
            "8, monitor:${monitors.primary}, persistent:true"
            "9, monitor:${monitors.primary}"
            "10, monitor:${monitors.primary}"
            "20, monitor:${monitors.secondary}, default:true, persistent:true, gapsout:0, border:false, rounding:false, decorate:false, shadow:false"
          ]
        else
          [
            "1, default:true, persistent:true"
            "2, persistent:true"
            "3, persistent:true"
            "4, persistent:true"
            "5, persistent:true"
            "6, persistent:true"
            "7, persistent:true"
            "8, persistent:true"
          ];
    };
}
