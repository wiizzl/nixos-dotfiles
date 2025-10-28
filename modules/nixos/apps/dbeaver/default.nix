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
  options.my.apps.dbeaver = {
    enable = mkEnableOption "Enable DBeaver Database Manager";
  };

  config = mkIf apps.dbeaver.enable {
    environment.systemPackages = with pkgs; [
      dbeaver-bin
    ];
  };
}
