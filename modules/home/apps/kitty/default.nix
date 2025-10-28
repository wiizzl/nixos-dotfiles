{ config, lib, ... }:

with lib;
let
  inherit (config.my) apps user;
in
{
  options.my.apps.kitty = {
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
