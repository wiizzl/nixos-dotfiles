{ lib, ... }:

{
  imports = [
    ../../themes/catppuccin.nix
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

    # autoUpgrade = false;
    autoGarbageCollector = true;
  };

  options = {
    var = lib.mkOption {
      type = lib.types.attrs;
      default = { };
    };
  };
}
