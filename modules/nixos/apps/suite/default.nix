{ config, lib, ... }:

with lib;
let
  inherit (config.my) apps;
in
{
  options.my.apps.suite = {
    libreoffice.enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable LibreOffice suite";
    };
    onlyoffice.enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable OnlyOffice suite";
    };
  };
}
