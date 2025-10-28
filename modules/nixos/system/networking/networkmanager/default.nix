{ config, lib, ... }:

with lib;
let
  inherit (config) system user;
in
{
  options.system.networking.networkmanager = {
    enable = mkEnableOption "Enable Network Manager";
  };

  config = mkIf system.networking.networkmanager.enable {
    networking.networkmanager.enable = true;
    users.users.${user.name}.extraGroups = [ "networkmanager" ];
  };
}
