{ ... }:

{
  services.picom = {
    enable = true;

    backend = "glx";
    vSync = true;

    inactiveOpacity = 0.8;
    activeOpacity = 0.9;

    fade = true;
    fadeDelta = 3;
    fadeSteps = [
      0.03
      0.03
    ];

    settings = {
      glx-use-copysubbuffer-mesa = true;
      glx-copy-from-front = true;
      glx-swap-method = 2;

      xrender-sync = true;
      xrender-sync-fence = true;

      blur-background = true;
      blur-background-fixed = true;
      blur = {
        method = "dual_kawase";
        size = 10;
        strength = 3;
      };

      corner-radius = 12.0;
    };
  };
}
