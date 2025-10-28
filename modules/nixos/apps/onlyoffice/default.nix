{
  pkgs,
  config,
  lib,
  ...
}:

with lib;
let
  inherit (config) apps;
in
{
  options.apps.onlyoffice = {
    enable = mkEnableOption "Enable OnlyOffice suite";
  };

  config = mkIf apps.onlyoffice.enable {
    environment.systemPackages = with pkgs; [
      onlyoffice-desktopeditors
    ];
  };
}
