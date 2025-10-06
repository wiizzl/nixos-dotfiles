{ ... }:

{
  services.picom = {
    enable = true;

    backend = "glx";
    vSync = true;

    inactiveOpacity = 0.9;
    activeOpacity = 1.0;

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
    };
  };
}
