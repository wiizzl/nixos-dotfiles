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
  options.apps.dbeaver = {
    enable = mkEnableOption "Enable DBeaver Database Manager";
  };

  config = mkIf apps.dbeaver.enable {
    environment.systemPackages = with pkgs; [
      dbeaver-bin
    ];
  };
}
