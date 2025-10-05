{ pkgs, ... }:

{
  services.xserver = {
    windowManager.i3 = {
      enable = true;

      extraPackages = with pkgs; [
        polybar
        feh
      ];
    };

    # desktopManager = {
    #   xterm.enable = false;
    #   xfce = {
    #     enable = true;
    #     noDesktop = true;
    #     enableXfwm = false;
    #   };
    # };
  };

  # services.displayManager = {
  #   defaultSession = "xfce+i3";
  # };
}
