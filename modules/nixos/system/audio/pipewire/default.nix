{ config, lib, ... }:

with lib;
let
  inherit (config) system;
in
{
  options.system.audio.pipewire = {
    enable = mkEnableOption "Enable pipewire audio system";
  };

  config = mkIf system.audio.pipewire {
    security.rtkit.enable = true;

    services.pipewire = {
      enable = true;
      pulse.enable = true;
      jack.enable = true;

      alsa = {
        enable = true;
        support32Bit = true;
      };
    };
  };
}
