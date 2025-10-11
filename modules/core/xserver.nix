{ config, ... }:

{
  services.xserver = {
    enable = false;

    xkb = {
      layout = config.var.keyboardLayout;
      variant = config.var.keyboardVariant;
    };
  };
}
