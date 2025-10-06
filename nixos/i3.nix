{ pkgs, ... }:

{
  services.xserver = {
    windowManager.i3 = {
      enable = true;

      extraPackages = with pkgs; [
        polybar
        feh
        xfce.ristretto
        xfce.thunar
        vlc
        pavucontrol
      ];
    };
  };
}
