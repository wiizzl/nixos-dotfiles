{ config, lib, ... }:

with lib;
let
  inherit (config) cli desktop user;
in
{
  config = mkIf cli.cava.enable {
    home-manager.users.${user.name} = {
      stylix = mkIf desktop.addons.stylix.enable {
        targets.cava.rainbow.enable = true;
      };

      programs.cava = {
        enable = true;

        settings = {
          general.framerate = 60;
        };
      };
    };
  };
}
