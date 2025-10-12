{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 5;
      gaps_out = 10;

      border_size = 1;
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
        size = 5;
        passes = 3;
        ignore_opacity = false;
        new_optimizations = true;
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
