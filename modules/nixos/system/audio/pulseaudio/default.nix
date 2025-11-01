{ config, lib, ... }:

with lib;
let
  inherit (config.my) system;
in
{
  config = mkIf system.audio.pulseaudio.enable {
    services.pulseaudio = {
      enable = true;
    };
  };
}
