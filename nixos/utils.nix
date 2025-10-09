{ pkgs, config, ... }:

let
  defaultLocale = config.var.defaultLocale;
  extraLocale = config.var.extraLocale;
in
{
  networking.hostName = config.var.hostname;

  networking.networkmanager.enable = true;
  # networking.wireless.enable = true;

  time.timeZone = config.var.timeZone;

  i18n = {
    defaultLocale = defaultLocale;

    extraLocaleSettings = {
      LC_ADDRESS = extraLocale;
      LC_IDENTIFICATION = extraLocale;
      LC_MEASUREMENT = extraLocale;
      LC_MONETARY = extraLocale;
      LC_NAME = extraLocale;
      LC_NUMERIC = extraLocale;
      LC_PAPER = extraLocale;
      LC_TELEPHONE = extraLocale;
      LC_TIME = extraLocale;
      LC_CTYPE = defaultLocale;
    };
  };

  services = {
    libinput = {
      enable = true;

      touchpad = {
        naturalScrolling = true;
      };

      mouse = {
        accelProfile = "flat";
      };
    };
  };

  console.keyMap = config.var.keyboardLayout;

  documentation = {
    enable = true;

    doc.enable = false;
    man.enable = true;
    dev.enable = false;
    info.enable = false;
    nixos.enable = false;
  };

  environment.systemPackages = with pkgs; [
    wget
    curl
    kitty
  ];
}
