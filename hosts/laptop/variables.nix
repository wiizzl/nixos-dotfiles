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
      monitors = {
        primary = "";
        secondary = "";
        values = [ ];
      };

      device = { };

      wallpaper = "mountainscapedark.jpg";
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
