{ config, lib, ... }:

with lib;
let
  inherit (config) apps user;
in
{
  options.apps.kitty = {
    enable = mkEnableOption "Enable Kitty terminal emulator";
  };

  config = mkIf apps.kitty.enable {
    home-manager.users.${user.name} = {
      programs.kitty = {
        enable = true;

        settings = {
          enable_audio_bell = false;
        };
      };
    };
  };
}
