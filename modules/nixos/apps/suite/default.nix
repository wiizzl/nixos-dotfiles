{ config, lib, ... }:

with lib;
let
  inherit (config.my) apps;
in
{
  options.my.apps.suite = {
    libreoffice.enable = mkEnableOption "LibreOffice suite";
    onlyoffice.enable = mkEnableOption "OnlyOffice suite";
  };
}
