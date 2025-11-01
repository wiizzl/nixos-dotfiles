{ config, lib, ... }:

with lib;
let
  inherit (config.my) system;
in
{
  config = mkIf system.audio.pipewire.enable {
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
