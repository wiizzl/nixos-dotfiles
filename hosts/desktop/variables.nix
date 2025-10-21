{ lib, ... }:

{
  imports = [
    ../../themes/catppuccin
  ];

  config.var = {
    hostname = "nixos";
    username = "pier";

    keyboardLayout = "fr";
    keyboardVariant = "azerty";

    location = "Paris";
    timeZone = "Europe/Paris";
    defaultLocale = "en_US.UTF-8";
    extraLocale = "fr_FR.UTF-8";

    git = {
      username = "wiizzl";
      email = "github@houlliere.com";
    };

    hyprland = {
      monitors = [
        "DP-2, 1920x1080@164.92, 0x0, 1"
        "HDMI-A-2, 1920x1200@59.95, auto-center-left, 1, transform, 1"
      ];
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
