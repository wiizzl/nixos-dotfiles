{ config, lib, ... }:

with lib;
let
  inherit (config) system;
in
{
  options.system.services.keyring = {
    enable = mkEnableOption "Enable Keyring";
    seahorse = mkOption {
      type = types.bool;
      default = false;
      description = "Enable seahorse GUI";
    };
  };

  config = mkIf system.services.keyring.enable {
    services.gnome.gnome-keyring.enable = true;
    programs.seahorse.enable = system.services.keyring.seahorse;
  };
}
