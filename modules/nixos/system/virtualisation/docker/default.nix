{ config, lib, ... }:

with lib;
let
  inherit (config.my) system user;
in
{
  options.my.system.virtualisation.docker = {
    enable = mkEnableOption "Enable Docker engine";
  };

  config = mkIf system.virtualisation.docker.enable {
    virtualisation.docker = {
      enable = true;

      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };

    users.users.${user.name}.extraGroups = [ "docker" ];
  };
}
