{ config, lib, ... }:

with lib;
let
  inherit (config.my) system;
in
{
  config = mkIf system.boot.systemd {
    boot.loader.systemd-boot = {
      enable = true;
      consoleMode = "auto";
      configurationLimit = 8;
    };
  };
}
