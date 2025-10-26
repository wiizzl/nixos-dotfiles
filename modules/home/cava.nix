{ ... }:

{
  stylix.targets.cava.rainbow.enable = true;

  programs.cava = {
    enable = true;

    settings = {
      general.framerate = 60;
      smoothing.noise_reduction = 88;
    };
  };
}
