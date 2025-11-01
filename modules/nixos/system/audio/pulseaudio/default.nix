{ config, lib, ... }:

with lib;
let
  inherit (config.my) system;
in
{
  options.my.system.audio = {
    pulseaudio.enable = mkEnableOption "Enable pipewire audio system";
  };

  config = mkIf system.audio.pulseaudio.enable {
    services.pulseaudio = {
      enable = true;
    };
  };
}
