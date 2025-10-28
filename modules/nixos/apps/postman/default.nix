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
  options.my.apps.postman = {
    enable = mkEnableOption "Enable Postman";
  };

  config = mkIf apps.postman.enable {
    environment.systemPackages = with pkgs; [
      postman
    ];
  };
}
