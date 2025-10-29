{ config, lib, ... }:

with lib;
let
  inherit (config.my) apps user;
in
{
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
