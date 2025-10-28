{
  pkgs,
  config,
  lib,
  ...
}:

with lib;
let
  inherit (config.my) apps;
in
{
  options.my.apps.onlyoffice = {
    enable = mkEnableOption "Enable OnlyOffice suite";
  };

  config = mkIf apps.onlyoffice.enable {
    environment.systemPackages = with pkgs; [
      onlyoffice-desktopeditors
    ];
  };
}
