{ config, lib, ... }:

with lib;
let
  inherit (config.my) system;
in
{
  options.my.system.services.openssh = {
    enable = mkEnableOption "Enable OpenSSH";
  };

  config = mkIf system.services.openssh.enable {
    programs.ssh.startAgent = true;

    services.openssh = {
      enable = true;

      settings = {
        PasswordAuthentication = true; # TODO: Passwordless sudo when SSH'ing with keys
        PermitRootLogin = "prohibit-password"; # "yes", "without-password", "prohibit-password", "forced-commands-only", "no"
      };
    };
  };
}
