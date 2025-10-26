{ lib, ... }:

{
  config.var = {
    hostname = "nixos";
    username = "pier";

    keyboardLayout = "fr";
    keyboardVariant = "azerty";

    timeZone = "Europe/Paris";
    defaultLocale = "en_US.UTF-8";
    extraLocale = "fr_FR.UTF-8";

    git = {
      username = "wiizzl";
      email = "github@houlliere.com";
    };

    hyprland = {
      waybar = {
        network = "enp14s0";
      };

      monitors = {
        primary = "DP-2";
        secondary = "HDMI-A-2";

        values = [
          "DP-2, 1920x1080@164.92, 0x0, 1"
          "HDMI-A-2, 1920x1200@59.95, auto-center-left, 1, transform, 1"
        ];
      };

      device = {
        name = "logitech-usb-receiver";
        sensitivity = -0.7;
      };

      wallpaper = "a_cartoon_of_a_woman_in_a_pool.jpg";
    };

    autoGarbageCollector = true;
  };

  options = {
    var = lib.mkOption {
      type = lib.types.attrs;
      default = { };
    };
  };
}
