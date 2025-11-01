{ config, lib, ... }:

with lib;
let
  inherit (config.my) apps;
in
{
  options.my.apps.suite = {
    libreoffice = mkEnableOption "LibreOffice suite";
    onlyoffice = mkEnableOption "OnlyOffice suite";
  };
}
