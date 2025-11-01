{ config, lib, ... }:

with lib;
let
  inherit (config.my) apps user;
in
{
  options.my.apps.terminal = {
    kitty.enable = mkEnableOption "Enable Kitty terminal emulator";
  };

  config = mkIf apps.terminal.kitty.enable {
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
