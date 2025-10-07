{ pkgs, config, ... }:

let
  hostname = config.var.hostname;
  keyboardLayout = config.var.keyboardLayout;
  keyboardVariant = config.var.keyboardVariant;
  timeZone = config.var.timeZone;
  defaultLocale = config.var.defaultLocale;
  extraLocale = config.var.extraLocale;
in
{
  networking.hostName = hostname;

  networking.networkmanager.enable = true;
  # networking.wireless.enable = true;

  # system.autoUpgrade = {
  #   enable = autoUpgrade;
  #   dates = "04:00";
  #   flake = "${configDir}";
  #   flags = [
  #     "--update-input"
  #     "nixpkgs"
  #     "--commit-lock-file"
  #   ];
  #   allowReboot = false;
  # };

  time.timeZone = timeZone;

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
    xserver = {
      enable = true;

      autoRepeatDelay = 200;
      autoRepeatInterval = 35;

      xkb = {
        layout = keyboardLayout;
        variant = keyboardVariant;
      };

      excludePackages = with pkgs; [ xterm ];
    };

    libinput = {
      enable = true;

      touchpad = {
        naturalScrolling = true;
        accelProfile = "flat";
      };

      mouse = {
        accelProfile = "flat";
      };
    };
  };

  console.keyMap = keyboardLayout;

  programs.dconf.enable = true;

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
    killall
    adwaita-icon-theme
  ];
}
