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
  options.apps.libreoffice = {
    enable = mkEnableOption "Enable LibreOffice suite";
  };

  config = mkIf apps.libreoffice.enable {
    environment.systemPackages = with pkgs; [
      libreoffice-qt
      hunspell
      hunspellDicts.fr-any
      hunspellDicts.en_US
    ];
  };
}
