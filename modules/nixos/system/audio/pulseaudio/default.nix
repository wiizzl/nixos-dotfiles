{ config, lib, ... }:

with lib;
let
  inherit (config) system;
in
{
  options.system.audio.pulseaudio = {
    enable = mkEnableOption "Enable pulseaudio audio system";
  };

  config = mkIf system.audio.pulseaudio {
    services.pulseaudio = {
      enable = true;
    };
  };
}
