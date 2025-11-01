{ config, lib, ... }:

with lib;
let
  inherit (config.my) system;
in
{
  options.my.system.audio = {
    pipewire.enable = mkEnableOption "Enable pipewire audio system";
    pulseaudio.enable = mkEnableOption "Enable pipewire audio system";
  };
}
