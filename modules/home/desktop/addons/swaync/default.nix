{ config, lib, ... }:

let
  inherit (lib) mkIf;
  inherit (config.my) desktop user;
in
{
  config = mkIf desktop.addons.swaync.enable {
    home-manager.users.${user.name} = {
      stylix = mkIf desktop.addons.stylix.enable {
        targets.swaync.enable = false;
      };

      services.swaync = {
        enable = true;

        settings = { };
      };
    };
  };
}
