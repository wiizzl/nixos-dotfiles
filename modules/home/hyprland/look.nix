{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 3;
      gaps_out = 8;

      border_size = 2;
      resize_on_border = false;

      allow_tearing = false;

      layout = "dwindle";
    };

    decoration = {
      rounding = 8;
      rounding_power = 2;

      active_opacity = 1.0;
      inactive_opacity = 0.9;

      shadow = {
        enabled = true;
        range = 4;
        render_power = 3;
      };

      blur = {
        enabled = true;
        size = 6;
        passes = 3;
        new_optimizations = true;
        ignore_opacity = true;
        xray = false;
      };
    };

    dwindle = {
      pseudotile = true;
      preserve_split = true;
    };

    master = {
      new_status = "master";
    };

    misc = {
      force_default_wallpaper = -1;
      disable_hyprland_logo = true;
    };
  };
}
